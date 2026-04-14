# Copilot Instructions

## Build and local preview

- Install dependencies: `npm install`
- Build the site: `npm run build`
- Clean generated output and Hexo cache: `npm run clean`
- Run a local preview server: `npm run server`

There are no repo-level test or lint scripts in the root `package.json`.

## High-level architecture

- This repository is a Hexo blog. The root `_config.yml` is the primary site configuration: it defines site metadata, permalink structure, pagination, the Atom feed plugin, and selects the active theme with `theme: even`.
- The active theme is vendored into the repository under `themes/even`. Theme behavior and site chrome are controlled from `themes/even/_config.yml` (menu, social links, analytics, comments, TOC, MathJax, color scheme). If you need to change rendered layout or theme assets, edit `themes/even/layout` and `themes/even/source`.
- Content is the source of truth under `source/`: posts live in `source/_posts`, standalone pages live in folders like `source/about` and `source/categories`, and post/page images live in `source/images`.
- Deployment is automated by `.github/workflows/pages.yml`: on pushes to `master`, GitHub Actions installs dependencies, runs `npm run build`, and publishes `public` to GitHub Pages.

## Key conventions

- The repo still contains `_config.landscape.yml`, but it is not the active theme config. Use `_config.yml` plus `themes/even/_config.yml`; do not treat `landscape` as the live theme unless the theme setting is intentionally changed.
- Treat `source/` as editable content and `public/` as generated output. `db.json` is Hexo's generated content database/cache; do not hand-edit it unless you are intentionally working on Hexo internals.
- Posts are written in Simplified Chinese and usually follow Hexo front matter with `title`, `date`, `tags`, and a single-item `categories` list. Sample posts consistently place `<!--more-->` near the top to define the homepage excerpt.
- The writing style is opinionated and essay-like rather than neutral. Existing posts and `.github/style.md` show a consistent pattern: lead with the core question or claim, use `##` headings and short lists to break down arguments, emphasize key phrases with inline code, and use Hexo tags such as `{% img %}` (and sometimes blockquotes) inside Markdown when images or callouts are needed.
- Theme navigation currently exposes Home, Archives, Categories, and About. Tags are disabled in `themes/even/_config.yml`, so prefer categories over tags when organizing new content unless you are also updating theme navigation and taxonomy behavior.
- If you need to change site presentation, prefer small edits inside the checked-in `themes/even` theme rather than assuming an upstream package will override it at build time.
