import { defineConfig } from 'astro/config';
import rehypeMermaid from 'rehype-mermaid';

export default defineConfig({
  site: 'https://hw-erl-lnaylor.github.io/Cangjie-UK-Team-Website/',
  base: '/Cangjie-UK-Team-Website/',
  output: 'static',
  markdown: {
    syntaxHighlight: {
      type: 'shiki',
      excludeLangs: ['mermaid'],
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
