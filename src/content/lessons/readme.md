# Lessons content conventions

This folder stores all Learn section source content.

## Structure

Lessons are grouped by difficulty:

- `beginner/`
- `intermediate/`
- `hard/`

Each lesson is a directory named in this format:

- `DD-TITLE`
- Underscored it `TITLE` instead of spaces
- Example: `01-Hello_World`

Each lesson directory must contain exactly these files:

- `description.md`
- `script.cj`

## Naming and ordering rules

1. Numbering is relative to each difficulty directory.
   - `beginner` starts at `01`
   - `intermediate` starts at `01`
   - `hard` starts at `01`
2. Numbers must be sequential with no gaps inside each directory.
   - Valid: `01`, `02`, `03`, ...
   - Invalid: `01`, `03`, `04`
3. The `TITLE` segment (after `DD-`) is used for slug generation.
4. Difficulty order in the site is fixed:
   - `beginner` -> `intermediate` -> `hard`

## Content rules

- `description.md`
  - Line 1 is the lesson title shown in the UI.
  - Remaining lines are the lesson explanation.
- `script.cj`
  - The Cangjie code shown in the code panel.

## How to add a new lesson

### Option A: append to end of a difficulty (recommended)

1. Pick a difficulty directory.
2. Use the next number in that directory.
   - Example: if the last folder is `10-arrays`, create `11-New_Topic`.
3. Add `description.md` and `script.cj`.
4. Run `npm run build` to validate.

### Option B: insert in the middle

1. Create the new lesson directory at the desired index.
2. Renumber all following lesson directories in that same difficulty so numbering stays sequential.
3. Run `npm run build`.

## Important note about URLs

Lesson URLs are generated using a global sequence across all difficulties.
Because of that, inserting or reordering lessons can change URLs for later lessons.
If stable links are important, prefer appending lessons instead of inserting.

## Validation checklist

Before committing:

- Every lesson directory has both `description.md` and `script.cj`.
- Directory numbering in each difficulty is sequential from `01`.
- `npm run build` succeeds.
