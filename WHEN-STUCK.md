# When you get stuck

First, the trick that solves 80% of cases:

> ### Copy the error message, paste it into Claude, and write:
> ### *"explain this error to me and tell me exactly what to do"*

It's very good at this. Never be embarrassed to paste an error — that's literally what it's for.

If that doesn't work, find your case below.

---

## "command not found: claude"

The Terminal doesn't know Claude exists yet.

**Fix:** quit the Terminal completely (`Cmd + Q`) and reopen it. Run the setup line again.

---

## "Claude Code requires a Pro, Max, Team or Enterprise account"

You're on the free plan. Claude Code doesn't work on it.

**Fix:** subscribe at [claude.ai/upgrade](https://claude.ai/upgrade). Then open the app and log in again.

---

## It asks for permission and I don't know whether to say yes

That's deliberate. It asks before touching files or running commands.

**How to decide:**

| It wants to... | What to do |
|---|---|
| Read or write inside the `My-Vault` folder | ✅ Go ahead |
| Create pages in `wiki/` | ✅ That's its job |
| Touch a folder outside the vault | ⚠️ Ask first: *"why do you need that?"* |
| Delete something | ⚠️ Ask first, always |
| Run a command you don't understand | ⚠️ Say: *"explain that command first"* |

You can **always** say no and ask why. It doesn't get offended.

---

## It messed up / wrote something wrong

Nothing here is permanent. Two ways out:

1. **Tell it:** *"that's wrong, it should be X. fix it and explain what you misunderstood."*
2. **Edit it yourself.** It's all markdown. Open the file and fix it by hand — the vault is yours.

And if it deleted something by accident: type `/rewind` to roll the conversation and files back to an earlier point.

---

## "You've reached your usage limit"

You've used your quota for the last 5 hours. It happens.

**Fix:** wait. The quota comes back on its own. If it happens constantly, the Max plan has a much higher limit.

---

## The app can't find my vault

**Fix:** in the app, **Code** tab, find the open-folder button and navigate to `Documents` → `My-Vault`. If the folder isn't there, run the setup line again — it recreates whatever is missing.

---

## The setup stopped halfway

**Fix:** run the same line again.

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/setup.sh | bash -s -- --lang en
```

The script is built for this: it skips everything already done, never deletes anything, and picks up where it left off.

---

## None of this worked

1. In the Terminal, run `claude doctor` — it runs a diagnostic and suggests fixes.
2. Send a screenshot to whoever gave you this kit.

---

## One thing to remember

You're not going to break anything. The realistic worst case is a badly written wiki page, and that's fixed by editing a text file.

Go ahead and experiment.

---

## Changed your mind and want it all gone?

No problem — see [how to uninstall](https://github.com/jarantes-prog/claude-code-starter-pack/blob/main/HOW-TO-UNINSTALL.md). Your notes (the vault) only disappear if you say so.
