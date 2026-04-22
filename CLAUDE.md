# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
npm install        # install dependencies
npm run server     # local preview server
npm run build      # generate static output to public/
npm run clean      # wipe public/ and Hexo's db.json cache
```

There are no test or lint scripts. Deployment to GitHub Pages happens automatically on push to `master` via `.github/workflows/pages.yml`.

## Architecture

This is a **Hexo** static blog, not Jekyll. Key config files:

- `_config.yml` — root site config (metadata, permalink, pagination, active theme `even`, Atom feed)
- `themes/even/_config.yml` — controls menu, social links, analytics, comments, TOC, MathJax, color scheme
- `_config.landscape.yml` — legacy, not the active theme; ignore it

Content lives under `source/`:
- `source/_posts/` — all blog posts (Simplified Chinese Markdown)
- `source/about/`, `source/categories/` — standalone pages
- `source/images/` — post images

`public/` and `db.json` are generated output — do not hand-edit them.

The theme is **vendored** at `themes/even/`. To change layout or styling, edit files inside `themes/even/layout/` and `themes/even/source/` directly rather than expecting an upstream package.

## Post Conventions

Front matter fields: `title`, `date`, `tags`, `categories` (single-item list). Place `<!--more-->` near the top to define the homepage excerpt.

Tags are disabled in theme navigation — prefer `categories` for organizing content.

For images inside posts, use the Hexo tag `{% img %}`. For callouts, use `{% blockquote %}`.

## Writing Style

Posts are opinionated Chinese-language essays for a 公众号-style audience. Key patterns from `.github/style.md`:

- Lead with the core question or claim before `<!--more-->`
- Use `##` headings and `-` bullet lists to break down arguments
- Highlight key phrases with inline code backticks or blockquotes
- Drive logic with rhetorical questions (self-ask, then answer)
- Use vivid analogies from everyday life to explain abstract/technical concepts
- Avoid academic jargon; prioritize practical, actionable insight
