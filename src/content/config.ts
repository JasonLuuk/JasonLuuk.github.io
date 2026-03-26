import { defineCollection, z } from "astro:content";

const blog = defineCollection({
  type: "content",
  schema: ({ image }) =>
    z.object({
      title: z.string(),
      description: z.string(),
      date: z.string(),
      authors: z.array(z.string()),
      repoLink: z.string().optional(),
      tags: z.array(z.string()).optional(),
      descriptionVideo: z.string().optional(),
      descriptionImage: image().optional(),
      showDescriptionImageInPost: z.boolean().optional(),
    }),
});

const news = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    date: z.string(),
  }),
});

const pages = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    route: z.string(),
  }),
});

const lessons = defineCollection({
  loader: async () => [],
  schema: z.any(),
});

export const collections = { blog, news, pages, lessons };
