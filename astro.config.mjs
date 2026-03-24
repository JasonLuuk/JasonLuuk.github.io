import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import rehypeMermaid from 'rehype-mermaid';
import cangjieShikiLanguage from './src/config/cangjie-shiki-language.mjs';

const normalizeBase = (value) => {
  const cleaned = String(value || '/').replace(/^\/+|\/+$/g, '');
  return cleaned ? `/${cleaned}/` : '/';
};

const explicitSite = process.env.PUBLIC_SITE_URL || process.env.SITE_URL;
const explicitBase = process.env.PUBLIC_BASE_PATH || process.env.BASE_PATH;

let site = explicitSite || 'https://cjpluk.github.io/';
let base = normalizeBase(explicitBase || '/');

if (!explicitSite && !explicitBase) {
  const repo = process.env.GITHUB_REPOSITORY || '';
  const [owner, repoName] = repo.split('/');
  if (owner && repoName) {
    const isUserOrOrgPagesRepo = repoName.toLowerCase().endsWith('.github.io');
    if (isUserOrOrgPagesRepo) {
      site = `https://${repoName}/`;
      base = '/';
    } else {
      site = `https://${owner}.github.io/${repoName}/`;
      base = `/${repoName}/`;
    }
  }
}

export default defineConfig({
  site,
  base,
  output: 'static',
  integrations: [sitemap()],
  markdown: {
    syntaxHighlight: {
      type: 'shiki',
      excludeLangs: ['mermaid'],
    },
    shikiConfig: {
      langs: [cangjieShikiLanguage],
      langAlias: {
        cj: 'cangjie',
      },
    },
    rehypePlugins: [
      [
        rehypeMermaid,
        {
          errorFallback: (element) => element,
        },
      ],
    ],
  },
});
