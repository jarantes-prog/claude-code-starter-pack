# Getting started with Claude Code

**A kit for people who have never opened a terminal.**

🇧🇷 [Versão em português](./README.md)

You'll walk away with Claude Code installed on your Mac, two good plugins already configured, and a *vault* — a knowledge base the AI maintains for you — ready to use.

Takes about 5 minutes. You open the Terminal **once** and never again.

---

## Before you start: you need a subscription

Claude Code **does not work on the free plan**. You need **Claude Pro** (~$20/month) or **Max**.

👉 Subscribe at [claude.ai/upgrade](https://claude.ai/upgrade) before continuing. Nothing here works without it.

---

## The single step

1. Press `Cmd + Space`, type **Terminal**, press `Enter`.
2. Paste the line below and press `Enter`:

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/setup.sh | bash -s -- --lang en
```

3. Wait. The script tells you everything it's doing as it goes.

When it finishes, it opens the app download in your browser and your vault folder. Then just follow the 5 steps printed on screen.

> **Something failed?** Run the same line again. The script is built to be repeated — it never deletes anything and skips whatever is already done.

---

## Then: read `FIRST-HOUR.md`

This is the part that actually matters. Five short exercises that take you from "installed it" to "I get what this is for." It's already inside your vault folder.

📄 Prefer a visual guide you can print? See [`guide.html`](./guide.html).

---

## What the script does (nothing hidden)

This project believes in **glass-box**: you have a right to know what ran on your machine. The whole [`setup.sh`](./setup.sh) is here for you to read. In short, it:

| # | What it does | Why |
|---|---|---|
| 1 | Checks your Mac is compatible (macOS 13+) and online | Failing early with a clear message beats failing halfway |
| 2 | Installs Claude Code via Anthropic's official installer | Auto-updates afterwards. No Homebrew, no Node |
| 3 | Installs 2 plugins: `superpowers` and `skill-creator` | Only two. Forty skills drown a beginner |
| 4 | Creates a `settings.json` with basic protections | Stops the AI from reading your passwords and keys by accident |
| 5 | Creates your vault at `~/Documents/My-Vault` | Your knowledge base |
| 6 | Opens the Claude app download in your browser | So you don't have to go hunting |

**What it does NOT do:** delete files, ask for your admin password, install Homebrew or Node, or touch existing settings (it backs them up first).

---

## Why both an app and a terminal?

Claude Code has two faces, and both read the **same configuration**:

- **The app** (**Code** tab) — where you'll actually live. Windows, buttons, drag-and-drop. No terminal.
- **The terminal command** — the script uses it purely as plumbing, to install the plugins.

So: the Terminal does the dirty work once, and you keep the nice app forever.

---

## What is a "vault"?

A folder with rules. You drop things into `raw/` (an article, a PDF, a transcript) and say **"ingest it"**. Claude reads it, summarizes it, creates linked pages, cites sources, and updates the index.

```
My-Vault/
├── Welcome.md    ← the rules Claude follows
├── index.md      ← the catalog of everything
├── log.md        ← the history of what changed
├── raw/          ← YOU put sources here (Claude never deletes them)
└── wiki/         ← Claude writes here
```

The idea: **you read, the AI writes.** Every new source connects to the previous ones, so the value *compounds*. This is the **ICM** methodology (Interpretable Context Methodology) — folders over agents, everything in readable markdown, no black box.

Works for any subject: a market you track, a hobby, university research, clients.

---

## Stuck?

Read [`WHEN-STUCK.md`](./WHEN-STUCK.md). And remember the single most useful trick:

> **Copy the error message, paste it into Claude, and ask: "explain this error to me and tell me what to do."**

It's good at this. Genuinely.

---

## Credits and license

- **ICM / "folders over agents"** — Jake Van Clief ([Clief Notes](https://www.skool.com/cliefnotes))
- **Original vault template** — [icm-knowledge-vault](https://github.com/jarantes-prog/icm-knowledge-vault)
- **superpowers** — official Anthropic plugin

MIT. Take it, fork it, send it to your friends.
