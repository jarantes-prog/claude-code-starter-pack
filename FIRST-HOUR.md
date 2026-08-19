# Your first hour with Claude Code

Five exercises. Each one ends with something visible happening.

Don't skip exercise 2 — that's where it clicks.

---

## First: open the right tab

Open the **Claude** app. At the top of the window you'll see a few tabs.

Click **Code**.

Then click to open a folder and choose `Documents/My-Vault`.

> **Why this matters:** Claude Code always works *inside a folder*. It reads the files there and follows the rules written in that folder's `Welcome.md`. Picking the folder is how you say "this is where we're working today."

---

## 1. Just talk (2 min)

Type anything. Really, anything:

```
hi! explain in 3 sentences what this vault I just created is
```

It'll read `Welcome.md` on its own and answer.

**What to learn here:** it already knows where it is and what's around it. You don't need to explain context that's sitting in the files.

---

## 2. Your first ingest ⭐ (15 min)

**This is the magic moment. Don't skip it.**

1. Find an article you **actually read** this week and found interesting. Any subject.
2. Copy the text (or save it as a PDF).
3. Put the file inside your vault's `raw/` folder.
   - In Finder: `Documents/My-Vault/raw/`
   - Or drag the file straight into the Claude window.
4. Go back to Claude and type:

```
ingest it
```

Now **watch**. It will:

- read the whole file
- talk to you about what it found important
- write a summary with cited sources
- create separate pages for every person, company, and concept that came up
- link everything together
- update `index.md` and `log.md`

One article becomes 5 to 15 linked pages. **That's normal.** That compounding is the whole point of the vault.

5. Open the `wiki/` folder in Finder and look at what appeared.

**What to learn here:** you didn't say "create a page about X." You said two words. The rules in `Welcome.md` did the rest. That's what "the AI maintains it for you" means in practice.

---

## 3. The question (5 min)

Now that there's content in there:

```
what do we know about [some topic from the article]?
```

It reads the index, follows the links, and answers **citing the very pages** it just created.

Ingest another article and ask again. The answer gets better. That's the point.

**What to learn here:** the difference between asking ChatGPT and asking your vault is that here the answer comes from *your* sources, and you can open the file and check.

---

## 4. See your superpowers (5 min)

Type:

```
/plugin
```

You'll see the two installed plugins. Take a look at what's inside **superpowers** — they're ready-made workflows Claude follows on its own when they fit.

Then type `/` by itself and browse the command list. Nothing to memorize.

---

## 5. Let it interview you (20 min)

Think of something you want to make. Anything — a website, an organized spreadsheet, a trip plan, a system for your recipes.

```
I want to make [your idea]. help me think it through properly before we start?
```

superpowers will switch into **brainstorming** mode: it asks **one question at a time**, figures out what you actually want, proposes different approaches with trade-offs, and only then starts.

**What to learn here:** the biggest difference between using AI badly and using it well isn't the perfect prompt. It's letting it ask you questions before it charges ahead.

---

## Done. Now what?

Three habits that make all the difference:

1. **One ingest a week.** Found a good article? Drop it in `raw/` and say "ingest it." In a month you'll have something nobody else has.
2. **Ask before you search.** "What do we know about X?" is faster than Googling again for something you already read.
3. **Ask it to explain what it did.** "Why did you create that page?" — understanding its choices teaches you to steer better.

And when you get stuck: [`WHEN-STUCK.md`](./WHEN-STUCK.md).
