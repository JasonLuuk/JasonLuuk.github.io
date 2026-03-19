import { readFile } from "node:fs/promises";
import { join } from "node:path";

export type LessonDifficulty = "beginner" | "intermediate" | "advanced";

export interface LessonEntry {
    fileName: string;
    slug: string;
    index: number;
    title: string;
    description: string;
    preview: string;
    code: string;
    difficulty: LessonDifficulty;
}

const learnRoot = join(process.cwd(), "public", "learn");
const lessonDirectory = join(learnRoot, "lessons");
const lessonManifestPath = join(learnRoot, "data.json");

const normalizeLineEndings = (value: string) => value.replace(/\r\n/g, "\n");

const toKebabCase = (value: string) =>
    value
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, "-")
        .replace(/^-+|-+$/g, "");

const createLessonSlug = (fileName: string, index: number) => {
    const base = toKebabCase(fileName);
    const safeBase = base.length > 0 ? base : `lesson-${index + 1}`;
    return `${String(index + 1).padStart(2, "0")}-${safeBase}`;
};

const getDifficulty = (index: number): LessonDifficulty => {
    if (index < 9) return "beginner";
    if (index < 31) return "intermediate";
    return "advanced";
};

const createPreview = (description: string) => {
    const plainText = description
        .split("\n")
        .map((line) => line.trim())
        .filter(Boolean)
        .join(" ");

    if (plainText.length === 0) {
        return "Open this lesson to read the full walkthrough and code sample.";
    }

    if (plainText.length <= 140) {
        return plainText;
    }

    return `${plainText.slice(0, 137)}...`;
};

const parseLessonText = (content: string, fallbackTitle: string) => {
    const normalized = normalizeLineEndings(content);
    const lines = normalized.split("\n");
    const title = lines[0]?.trim() || fallbackTitle;
    const description = lines.slice(1).join("\n").trim() || title;

    return { title, description };
};

const loadManifest = async (): Promise<string[]> => {
    const rawManifest = await readFile(lessonManifestPath, "utf-8");
    const parsedManifest = JSON.parse(rawManifest) as unknown;

    if (
        !Array.isArray(parsedManifest) ||
        parsedManifest.some((entry) => typeof entry !== "string")
    ) {
        throw new Error("public/learn/data.json must be an array of lesson names.");
    }

    return parsedManifest;
};

const loadLessons = async (): Promise<LessonEntry[]> => {
    const lessonNames = await loadManifest();

    const lessons = await Promise.all(
        lessonNames.map(async (rawFileName, index) => {
            const fileName = rawFileName.trim();

            if (fileName.length === 0) {
                throw new Error(
                    `Lesson name at index ${index} in public/learn/data.json is empty.`,
                );
            }

            const [textContent, codeContent] = await Promise.all([
                readFile(join(lessonDirectory, `${fileName}.txt`), "utf-8"),
                readFile(join(lessonDirectory, `${fileName}.cj`), "utf-8"),
            ]);

            const { title, description } = parseLessonText(textContent, fileName);

            return {
                fileName,
                slug: createLessonSlug(fileName, index),
                index,
                title,
                description,
                preview: createPreview(description),
                code: normalizeLineEndings(codeContent).trimEnd(),
                difficulty: getDifficulty(index),
            };
        }),
    );

    return lessons;
};

let lessonsPromise: Promise<LessonEntry[]> | null = null;

export const getLessons = async () => {
    if (!lessonsPromise) {
        lessonsPromise = loadLessons();
    }

    return lessonsPromise;
};
