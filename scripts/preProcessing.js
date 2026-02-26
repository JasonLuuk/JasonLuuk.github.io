import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { remark } from 'remark';
import remarkGfm from 'remark-gfm';
import remarkRehype from 'remark-rehype';
import rehypeRaw from 'rehype-raw';
import rehypeStringify from 'rehype-stringify';
import { getHighlighter } from 'shiki';
import { visit } from 'unist-util-visit';
import rehypeSlug from 'rehype-slug';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const cangjieGrammar = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, '..', 'data', 'CangjieHighlights.json'), 'utf-8')
);

const highlighter = await getHighlighter(
{
    theme: 'light-plus',
    langs: [
        {
            id: 'cangjie',
            scopeName: cangjieGrammar.scopeName,
            grammar: cangjieGrammar
        },
        'javascript',
        'typescript',
        'cpp',
        'python',
        'json',
        'bash',
        'css'
    ]
});

async function convertMdFile(mdFilePath, outputDir)
{
    const mdContent = fs.readFileSync(mdFilePath, 'utf-8');
    const name = path.basename(mdFilePath, '.md');

    const processed = await remark()
    .use(remarkGfm)
    .use(() => (tree) => {
        visit(tree, 'code', (node) => {
        const lang = node.lang || "plaintext" ;
        node.type = 'html';
        try {
            node.value = highlighter.codeToHtml(node.value.trim(), lang);
        } catch (_) {
            // Gracefully fall back for unsupported fence languages (e.g. mermaid).
            node.value = highlighter.codeToHtml(node.value.trim(), "plaintext");
        }
        });
    })
    .use(remarkRehype, { allowDangerousHtml: true })
    .use(rehypeRaw)
    .use(rehypeSlug)
    .use(rehypeStringify, { allowDangerousHtml: true })
    .process(mdContent);

    const bodyHtml = processed.toString();
    const htmlFileName = name + '.html';
    fs.writeFileSync(path.join(outputDir, htmlFileName), bodyHtml);
}

function getFirstH1(mdContent) {
    const line = mdContent.split('\n').find(l => /^#\s+.+/.test(l));
    return line ? line.replace(/^#\s+/, '').trim() : '';
}

function getFirstSentenceFromBody(mdContent) {
    const lines = mdContent.split('\n');
    let started = false;
    let text = '';
    for (const line of lines) {
        if (/^#\s+/.test(line)) {
            started = true;
            continue;
        }
        if (started) {
            const t = line.trim();
            if (t) {
                text += (text ? ' ' : '') + t;
                const match = text.match(/^[^.!?]*[.!?]/);
                if (match) return match[0].trim();
            }
        }
    }
    return (text.split(/[.!?]/)[0] || text).trim() || '';
}

function getFileDateDDMMYYYY(filePath) {
    const stat = fs.statSync(filePath);
    const d = stat.birthtime || stat.ctime;
    const day = String(d.getDate()).padStart(2, '0');
    const month = String(d.getMonth() + 1).padStart(2, '0');
    const year = d.getFullYear();
    return `${day}/${month}/${year}`;
}

const blogsDir = path.resolve('./blogs');
const outputDir = path.resolve('./blogsHTML');
const blogInfoPath = path.resolve('./data/blogInformation.json');
if (!fs.existsSync(outputDir)) fs.mkdirSync(outputDir);

function ensureBlogInformation() {
    const mdFiles = fs.existsSync(blogsDir)
        ? fs.readdirSync(blogsDir).filter(f => f.endsWith('.md'))
        : [];
    let list = [];
    if (fs.existsSync(blogInfoPath)) {
        list = JSON.parse(fs.readFileSync(blogInfoPath, 'utf-8'));
        if (!Array.isArray(list)) list = [];
    }
    const known = new Set(list.map(e => (e.slug || e.name || '').trim()));
    let added = 0;
    for (const file of mdFiles) {
        const slug = path.basename(file, '.md');
        if (known.has(slug)) continue;
        const mdPath = path.join(blogsDir, file);
        const mdContent = fs.readFileSync(mdPath, 'utf-8');
        const name = getFirstH1(mdContent) || slug;
        const date = getFileDateDDMMYYYY(mdPath);
        const description = getFirstSentenceFromBody(mdContent) || '';
        list.push({
            name,
            slug,
            repoLink: '',
            authors: [],
            date,
            description,
            tags: []
        });
        known.add(slug);
        added++;
    }
    if (added) fs.writeFileSync(blogInfoPath, JSON.stringify(list, null, 2) + '\n', 'utf-8');
}

ensureBlogInformation();

async function processAllBlogs()
{
    const files = fs.readdirSync(blogsDir).filter(f => f.endsWith('.md'));
    for (const file of files)
    {
        try
        {
            await convertMdFile(path.join(blogsDir, file), outputDir);
        } catch (err)
        {
            console.error(`Error processing ${file}:`, err);
        }
    }
}

const newsDir = path.resolve('./news');
const newsOutputDir = path.resolve('./newsHTML');
if (!fs.existsSync(newsOutputDir)) fs.mkdirSync(newsOutputDir);

async function processAllNews()
{
    if (!fs.existsSync(newsDir)) return;
    const files = fs.readdirSync(newsDir).filter(f => f.endsWith('.md'));
    for (const file of files)
    {
        try
        {
            await convertMdFile(path.join(newsDir, file), newsOutputDir);
        } catch (err)
        {
            console.error(`Error processing news ${file}:`, err);
        }
    }
}

const pagesDir = path.resolve('./pages');
const pagesOutputDir = path.resolve('./pagesHTML');
if (!fs.existsSync(pagesOutputDir)) fs.mkdirSync(pagesOutputDir);

async function processAllPages()
{
    if (!fs.existsSync(pagesDir)) return;
    const files = fs.readdirSync(pagesDir).filter(f => f.endsWith('.md'));
    for (const file of files)
    {
        try
        {
            await convertMdFile(path.join(pagesDir, file), pagesOutputDir);
        } catch (err)
        {
            console.error(`Error processing page ${file}:`, err);
        }
    }
}

function getBuildTarget() {
    const targetArg = process.argv.find(arg => arg.startsWith('--target='));
    if (!targetArg) return 'all';
    const target = targetArg.split('=')[1];
    if (target === 'blogs' || target === 'news' || target === 'pages' || target === 'all') {
        return target;
    }
    return 'all';
}

const target = getBuildTarget();

if (target === 'blogs' || target === 'all') await processAllBlogs();
if (target === 'news' || target === 'all') await processAllNews();
if (target === 'pages' || target === 'all') await processAllPages();
