# Welcome — the rules of this vault

This is an **LLM-maintained wiki**. A knowledge base that grows and cross-links itself: you pick the sources and direct the analysis, the AI does the bookkeeping — summarizing, cross-referencing, filing, and keeping everything consistent.

**You read; the AI writes.**

> This file is the contract. Everything the AI does in here follows what's written below. If you want to change how it works, change this file — or ask it to.

---

## The three layers

1. **Sources** (`raw/`) — **immutable**. Articles, PDFs, notes, transcripts, images. The AI reads but **never** modifies or deletes.
2. **The wiki** (`wiki/`) — AI-written markdown. Summaries, entity pages, concept pages, analyses.
3. **The schema** (this file) — the rules. Evolves with use.

---

## Folder structure

```
My-Vault/
├── Welcome.md              ← this file, the rules
├── CLAUDE.md               ← makes Claude Code auto-load Welcome.md
├── index.md                ← the catalog (updated on every ingest)
├── log.md                  ← chronological, append-only history
├── raw/                    ← IMMUTABLE SOURCES
│   └── assets/             ← images and attachments
└── wiki/                   ← the AI's territory
    ├── overview/           ← top-level syntheses
    ├── entities/           ← people, places, orgs, products
    ├── concepts/           ← themes, ideas, frameworks
    ├── sources/            ← one summary per ingested source
    └── analysis/           ← comparisons, filed-back answers, deep dives
```

### File naming

- Pages use **Title Case** with spaces: `Vannevar Bush.md`, `Memex Concept.md`.
- Source summaries are date-prefixed: `2026-07-22 — Article Title.md`.
- Use `[[Wiki Links]]` to connect pages.

### Frontmatter (the YAML header)

Every wiki page starts with:

```yaml
---
type: entity | concept | source | analysis | overview
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [tag1, tag2]
sources: ["[[Source Page]]"]
---
```

Source pages get three extra fields:

```yaml
source_type: article | paper | podcast | book | video | note | conversation
source_url: https://...
source_date: YYYY-MM-DD
```

---

## The three operations

### 1. Ingest — *"ingest it"*

When the user drops something in `raw/` and asks to ingest it:

1. **Read** the source fully.
2. **Discuss** the key takeaways with the user **before writing** — confirm the angle and emphasis.
3. **Write the summary** in `wiki/sources/YYYY-MM-DD — Title.md` with: a 2–4 sentence TL;DR, key claims as bullets, entities and concepts as `[[links]]`, notable quotes, and open questions.
4. **Create or update entity pages** for every new person/place/org/product. Each ends with `## Appears in`.
5. **Create or update concept pages** for every new idea. Each ends with `## Sources` and `## Related concepts`.
6. **Update the overview** only when the new source genuinely shifts the big picture — not every ingest.
7. **Update `index.md`** with the new pages and a one-line summary each.
8. **Append to `log.md`**: `## [YYYY-MM-DD] ingest | Title` and the pages touched.
9. **Report back in chat**: what you created, what changed, any contradictions, and 1–3 suggested follow-up sources.

An ingest typically touches **5–15 pages**. That's normal — that's exactly where the value is.

### 2. Query — *"what do we know about X?"*

1. **Read `index.md` first** to find candidate pages.
2. **Drill into the relevant pages**, following `[[links]]`.
3. **Synthesize with explicit citations**: "According to [[Source Name]]...".
4. **Format to the question**: direct answer in markdown; comparison as a table; timeline as a chronological list.
5. **File good answers back** into `wiki/analysis/` when they produce a new synthesis worth keeping. Ask if unsure.

### 3. Lint — *"run a health check"*

Look for and report: contradictions between pages, stale claims, orphan pages (nothing links to them), missing pages (concepts mentioned but with no page of their own), and gaps where a new source would help.

Deliver the report in chat. If the user approves the fixes, apply them and log it.

---

## Rules of engagement

1. **The AI owns `wiki/`, the index, and the log.** The user can edit freely, but the AI maintains them.
2. **`raw/` is immutable.** Never overwrite or delete. Add only.
3. **Always cite.** Every claim in the wiki traces to a `[[Source]]`. No orphan claims.
4. **Flag contradictions, don't resolve them silently.** Write both views and say which source backs which.
5. **Prefer updating an existing page over creating a new one.** Check `index.md` first.
6. **Update `index.md` and `log.md` in the same pass** as the content. Never let them drift.
7. **When unsure about scope, ask.**
8. **Discuss before writing** during ingests.
9. **Keep summaries tight.** TL;DRs are 2–4 sentences.
10. **The schema evolves.** If a better workflow emerges, propose an edit to this file.

---

## A note for beginners

You don't need to understand all of this yet. Two things matter on day one:

- Put a file in `raw/` and say **"ingest it"**.
- Then ask **"what do we know about X?"**.

The rest starts making sense on its own.

When you want a more advanced version of this schema — with trust layers (`canon` vs. `synthesis`) and cascading review — see the [full template](https://github.com/jarantes-prog/icm-knowledge-vault).
