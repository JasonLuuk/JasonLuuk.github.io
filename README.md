# Cangjie UK Team website

We are a team based in the Edinburgh focused on the Cangjie programming language — sharing tutorials, writing blogs, and building practical resources for developers.

## Run the site locally (Python)

You need a local HTTP server; do not open `index.html` directly in the browser (blog and news content will not load).

**Python 3** (no extra install if you have Python):

```bash
# From the project root directory
python -m http.server 8000
```

Then open **http://localhost:8000** in your browser. Use another port if 8000 is in use (e.g. `8080`).

## Install npm dependencies (for building markdown pages)

The build that turns markdown (in `blogs/`, `news/`, and `pages/`) into HTML uses Node.js and the following packages. Install once from the project root:

```bash
npm install
```

Or, for a clean install matching the lockfile:

```bash
npm ci
```

**Build dependencies and versions** (used by markdown build scripts):

| Package | Version | Purpose |
|---------|---------|---------|
| remark | ^14.0.2 | Markdown parser |
| remark-gfm | ^3.0.1 | GitHub Flavored Markdown (tables, strikethrough, etc.) |
| remark-rehype | ^10.1.0 | Convert markdown AST to HTML AST |
| rehype-raw | ^6.1.1 | Allow raw HTML in markdown |
| rehype-stringify | ^9.0.3 | Serialise HTML AST to string |
| rehype-slug | ^5.0.0 | Add `id` to headings (for table of contents) |
| shiki | ^0.12.0 | Code syntax highlighting (including Cangjie) |
| unist-util-visit | ^4.1.0 | Walk the AST for code blocks |

Exact resolved versions are in **package-lock.json**.

Build commands:
- `npm run build-content` generates `blogsHTML/`, `newsHTML/`, and `pagesHTML/`.
- `npm run build-blogs` generates only `blogsHTML/`.
- `npm run build-news` generates only `newsHTML/`.
- `npm run build-pages` generates only `pagesHTML/`.

Markdown section pages in `pages/*.md` are rendered via:
- `pages/sectionTemplate.html?slug=<file-name-without-md>`
- Example: `pages/sectionTemplate.html?slug=distributed-actors`

## How to add a new blog to the website?

You need to add another entry in **data/blogInformation.json**, and add a *.md* file with your blog content in the **blogs/** folder. The name in the *.json* file has to match the name of the *.md* file.

In the JSON file you should include:
- authors of the blog
- gitcode repo link (can be empty)
- name of the blog
- date of creation

When you push changes to **blogs/**, **news/**, or **pages/** (or relevant data/build files), the GitHub Actions workflow generates HTML outputs and commits them. To build locally (e.g. before pushing), from the project root run:

```bash
npm run build-content
```

## How to add or update news?

- **Add a new news item**
  1. Create a *.md* file in the **news/** folder (e.g. `My News Title.md`).
  2. Add an entry in **data/newsInformation.json** with:
     - **name**: exactly the filename without `.md` (e.g. `My News Title` — must match the file).
     - **title**: the title shown in the list and on the news page.
     - **date**: in `DD/MM/YYYY` format.
  3. Run `npm run build-news` (or `npm run build-content`) to generate the HTML.

- **Update existing news content**
  1. Edit the *.md* file in **news/**.
  2. Run `npm run build-news` (or `npm run build-content`) so the corresponding HTML in **newsHTML/** is regenerated.

- **Rename a news file**
  1. Rename the *.md* file in **news/**.
  2. Update the **name** field of that item in **data/newsInformation.json** so it matches the new filename (without `.md`).
  3. Run `npm run build-news` (or `npm run build-content`).

The list and links on the homepage are driven by **data/newsInformation.json**; the **name** in each entry must always match the *.md* filename (without extension). 
