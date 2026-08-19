# How to uninstall

Changed your mind, or just want to clean everything up? No stress. It takes about two minutes, and nothing here is dangerous.

> **The important part:** your **vault** (the folder with your notes) is **yours**. Steps 1 and 2 below **don't touch it**. Only delete the vault if you truly want to — that's step 3, separate and clearly marked.

---

## 1. Remove the app

1. If Claude is open, quit it completely (`Cmd + Q`).
2. In Finder, go to **Applications**, find **Claude**, and drag it to the Trash.

---

## 2. Remove Claude Code (the command, settings, and plugins)

Open the Terminal (`Cmd + Space`, type **Terminal**, `Enter`) and paste these two lines, one at a time:

```bash
rm -rf ~/.claude
rm -f ~/.local/bin/claude
```

What each one does:

- `~/.claude` — all of Claude Code's settings, plugins, and history (everything, not just this kit).
- `~/.local/bin/claude` — the `claude` command itself.

If you also want to remove the versions it kept for self-updating (only exists on some installs — it's fine if it doesn't):

```bash
rm -rf ~/.local/share/claude
```

> Not sure a file exists? You can run the line anyway — if it isn't there, it does nothing and doesn't error.

---

## 3. (Optional) Remove your vault

⚠️ **This deletes your notes, and can't be undone.** Only do it if you're sure.

```bash
rm -rf ~/Documents/My-Vault
```

Created the vault somewhere else? Swap the path for the right place.

---

## 4. (Optional) Tidy up your PATH

The installer may have added a line to your `~/.zshrc` so it could find the command. It's harmless to leave. To remove it, open the file with `open -e ~/.zshrc` and delete the line mentioning `.local/bin`.

---

## Done

That's it. If you ever want to come back, it's the same one line as always:

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/setup.sh | bash -s -- --lang en
```
