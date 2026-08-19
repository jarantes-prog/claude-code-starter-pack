# Nível 2 — Claude Code no VS Code

Já fez a [primeira hora](./PRIMEIRA-HORA.md) no app do Claude? Ótimo. Quando quiser **mais poder** — seus arquivos abertos do lado da conversa, um ambiente de trabalho de verdade — dá pra usar o **mesmo Claude Code dentro do VS Code**.

Isto é **opcional**. O app continua funcionando; você pode usar os dois. É o mesmo vault e a mesma assinatura.

> Não precisa disso pra começar. Venha aqui quando já estiver à vontade e quiser dar um passo além.

---

## O jeito fácil (uma linha)

Abra o Terminal (`Cmd + Espaço`, digite **Terminal**, `Enter`) e cole:

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/vscode.sh | bash
```

Isso baixa o VS Code, instala a extensão do Claude Code e abre o seu vault lá dentro. Quando terminar:

1. No VS Code, ache o ícone **✱ Claude Code** (na barra lateral esquerda ou no topo) e clique.
2. Faça login com a sua conta (a mesma assinatura **Pro** ou **Max**).
3. Pronto — agora você conversa com o Claude ali mesmo.

> Assim como o outro, esse script pode ser rodado de novo sem medo: ele pula o que já está pronto e nunca apaga nada.

---

## O jeito manual (se preferir ver cada passo)

1. **Baixe o VS Code** em [code.visualstudio.com](https://code.visualstudio.com/). Abra o arquivo `.zip` baixado e arraste o **Visual Studio Code** pra pasta **Aplicativos**.
2. **Instale a extensão.** Abra o VS Code, aperte `Cmd + Shift + X`, procure por **Claude Code** e clique em **Install**. (É a extensão `anthropic.claude-code`.)
3. **Abra o seu vault.** No menu, `File > Open Folder…` e escolha `Documents/Meu-Vault`.
4. **Ligue o Claude.** Clique no ícone **✱ Claude Code** e faça login.

---

## Bom saber

- Precisa do **VS Code 1.94 ou mais novo** (o download acima já vem atualizado).
- A extensão **traz o próprio motor embutido** — você não precisa mexer em terminal pra usar o painel de conversa.
- O login é um passo no **navegador**, só na primeira vez. Mesma assinatura do app, **sem API key**.
- O **app e o VS Code convivem** — os dois leem a mesma configuração e o mesmo vault. Use o que fizer mais sentido no momento.

Travou? O [`QUANDO-TRAVAR.md`](./QUANDO-TRAVAR.md) continua valendo, e o truque de sempre também: copie o erro, cole no Claude, e peça pra ele te explicar.
