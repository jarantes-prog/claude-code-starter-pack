# Level 2 — Claude Code in VS Code

Done your [first hour](./FIRST-HOUR.md) in the Claude app? Great. When you want **more power** — your files open next to the conversation, a real working environment — you can use the **same Claude Code inside VS Code**.

This is **optional**. The app keeps working; you can use both. It's the same vault and the same subscription.

> You don't need this to get started. Come here once you're comfortable and want to take a step further.

---

## The easy way (one line)

Open the Terminal (`Cmd + Space`, type **Terminal**, `Enter`) and paste:

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/vscode.sh | bash -s -- --lang en
```

That downloads VS Code, installs the Claude Code extension, and opens your vault inside it. When it finishes:

1. In VS Code, find the **✱ Claude Code** icon (left side bar or top) and click it.
2. Sign in with your account (the same **Pro** or **Max** subscription).
3. That's it — now you chat with Claude right there.

> Like the other one, this script is safe to re-run: it skips whatever is already done and never deletes anything.

---

## The manual way (if you'd rather see each step)

1. **Download VS Code** from [code.visualstudio.com](https://code.visualstudio.com/). Open the downloaded `.zip` and drag **Visual Studio Code** into your **Applications** folder.
2. **Install the extension.** Open VS Code, press `Cmd + Shift + X`, search for **Claude Code**, and click **Install**. (It's the `anthropic.claude-code` extension.)
3. **Open your vault.** From the menu, `File > Open Folder…` and choose `Documents/My-Vault`.
4. **Turn on Claude.** Click the **✱ Claude Code** icon and sign in.

---

## Good to know

- Needs **VS Code 1.94 or newer** (the download above is already up to date).
- The extension **has its own built-in engine** — you don't need to touch a terminal to use the chat panel.
- Sign-in is a step in the **browser**, only the first time. Same subscription as the app, **no API key**.
- The **app and VS Code coexist** — both read the same config and the same vault. Use whichever fits the moment.

Stuck? [`WHEN-STUCK.md`](./WHEN-STUCK.md) still applies, and the usual trick too: copy the error, paste it into Claude, and ask it to explain.
