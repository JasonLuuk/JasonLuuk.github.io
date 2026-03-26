# Cangjie UK Team website

We are a team based in the Edinburgh focused on the Cangjie programming language — sharing tutorials, writing blogs, and building practical resources for developers.

## Install dependencies

From the project root:

```bash
npm install
```

Or, for a clean install matching the lockfile:

```bash
npm ci
```

## Run locally

Start the Astro dev server:

```bash
npm run dev
```

Then open:

```text
http://localhost:4321
```

## Build for production

```bash
npm run build
```

## How to add a new blog post

Create a Markdown file in `src/content/blog/`.

Use a lowercase, hyphenated filename where possible. The filename is important because it affects the generated slug and URL unless you explicitly set `slug` in the frontmatter.

Example:

```text
src/content/blog/my-new-blog-post.md
```

Required frontmatter fields:

- `title`
- `description`
- `date` in `DD/MM/YYYY` format
- `authors` as an array

Optional frontmatter fields:

- `repoLink`
- `tags`
- `descriptionVideo`
- `descriptionImage`
- `showDescriptionImageInPost`
- `slug`

Example:

```md
---
title: "My New Blog Post"
description: "A short summary for the homepage and SEO."
date: "26/03/2026"
authors:
  - "Author Name"
tags:
  - "Tutorial"
descriptionImage: "figures/example.png"
---
```

Notes:

- Put blog images in `src/content/blog/figures/`
- `descriptionImage` is used as the blog cover/summary image
- If you want the cover image on the blog page above the title, keep the image only in frontmatter
- If you also insert the same image inside the Markdown body, it will appear twice
- For YouTube auto-embed inside the article body, use a normal video URL in a paragraph containing `Video Link`

## How to add a news post

Create a Markdown file in `src/content/news/`.

Example:

```text
src/content/news/my-news-post.md
```

Required frontmatter fields:

- `title`
- `date` in `DD/MM/YYYY` format

Example:

```md
---
title: "My News Title"
date: "26/03/2026"
---
```

Notes:

- Put news images in `src/content/news/figures/`
- News items are rendered from the `news` content collection
- The public route for news is generated from its date-based ordering, not directly from the filename
