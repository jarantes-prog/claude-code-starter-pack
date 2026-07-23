# claude-comeco — design

**Date:** 2026-07-22
**Goal:** Get a non-technical friend (Cata Lobo) from zero to productive on Claude Code on macOS, in Portuguese, with good defaults already in place.

## The user

Non-technical. Has never used a terminal. Doesn't know git or node. No specific goal for the tool yet — curious, exploring, wants a good default setup to poke at.

That profile drives every decision below. The two failure modes to design against are **stranding her mid-install** and **drowning her in capability she can't use**.

## Constraints established

| Fact | Source | Consequence |
|---|---|---|
| Claude Code needs Pro/Max; free plan is excluded | `code.claude.com/docs/en/setup` | Subscription is step zero, stated loudly in every doc |
| Desktop app reads the same `~/.claude/` as the CLI | `code.claude.com/docs/en/desktop` | Script configures via CLI; she lives in the app |
| Native installer is `curl -fsSL https://claude.ai/install.sh \| bash` | docs | No Homebrew, no Node, auto-updates afterwards |
| `claude plugin install <p>@<mkt> --scope user` is non-interactive | `claude plugin install --help` | Whole plugin setup is scriptable |
| `https://claude.ai/` returns 403 to curl | measured | Connectivity check must probe the installer URL, not the homepage |
| `claude plugin install` creates `settings.json` itself | measured in sandbox | Settings step **must** run before the plugin step |

## Decisions

**Delivery: one public repo, one pasted line.** She opens Terminal exactly once. Alternatives rejected: a conversational "Claude installs itself" prompt (she'd approve ~6 tool calls she can't evaluate); a 15-step click-through of the `/plugin` menu (15 chances to get lost).

**Two plugins only** — `superpowers` and `skill-creator`. `code-review` and `karpathy-skills` are dev-only noise for this user. A beginner with 40 skills is worse off than one with 5 good ones.

**She does not get `bypassPermissions`.** The author runs it knowingly; on a beginner's machine it is a footgun with no upside. She gets default ask-first plus a 13-rule deny-list for `.env`, `*.pem`, `.ssh/**` and friends. Clicking "allow" is how she learns what the agent is doing.

**Tarball, not `git clone`.** `git` on a clean Mac triggers the Xcode Command Line Tools GUI prompt, which would strand her behind a dialog she doesn't understand.

**Never destructive.** The script creates but never overwrites: existing `settings.json` is backed up and left alone, an existing vault is left alone. It is safe to re-run, so "paste it again" is always a valid recovery instruction.

**The vault ships from the public template, never from the author's own vault**, which contains private client and Forge material.

**Simplified vault schema.** The starter `Welcome.md` drops the `authority`/`review` cascade from the full ICM template — too much machinery for day one. It links to the full template for later.

## Deliverables

```
claude-comeco/
├── setup.sh              # bilingual, idempotent, env-overridable for testing
├── README.md / .en.md    # what it is + what the script does, line by line
├── PRIMEIRA-HORA.md / FIRST-HOUR.md   # 5 guided exercises
├── QUANDO-TRAVAR.md / WHEN-STUCK.md   # troubleshooting
├── guia.html             # printable walkthrough, PT/EN toggle
└── vault/{pt,en}/        # the ICM starter vault in both languages
```

**The first-hour guide is the actual product.** The script is 10 minutes of plumbing; exercise 2 (first ingest → 5-15 linked pages from two words) is what decides whether she still uses this next week.

## Verification performed

- `bash -n` syntax check.
- Full end-to-end run in an isolated `HOME` with a shimmed `open`, a local tarball, and a stub DMG.
- Fresh-install run: 13 deny rules written, both plugins enabled, permissions left at default ask.
- Immediate re-run: every step correctly skipped, nothing clobbered.
- English run in a second clean `HOME`: correct vault name, correct guides copied.
- HTML: no unclosed tags, no nesting errors, both themes + print styles present.

## Known open items

- The one-liner is `curl | bash`, the pattern security guidance warns about. Accepted: it is the same pattern Anthropic's own installer uses, the full script is published for reading, and the README explains every step. Worth restating if the kit is ever distributed beyond friends.
- Repo must be created at `github.com/jarantes-prog/claude-comeco` and made public before the one-liner resolves.
