# Sua primeira hora com o Claude Code

Cinco exercícios. Cada um termina com algo visível acontecendo.

Não pule o exercício 2 — é onde a ficha cai.

---

## Antes: abra a aba certa

Abra o app **Claude**. No topo você vê três abas: **Chat**, **Cowork** e **Code**.

Clique em **Code**.

Depois clique em abrir pasta e escolha `Documents/Meu-Vault`.

> **Por que isso importa:** o Claude Code sempre trabalha *dentro de uma pasta*. Ele lê os arquivos que estão ali e obedece às regras escritas no `Welcome.md` daquela pasta. Escolher a pasta é como dizer "é aqui que a gente vai trabalhar hoje".

---

## 1. Só conversa (2 min)

Digite qualquer coisa. Sério, qualquer coisa:

```
oi! me explica em 3 frases o que é esse vault que eu acabei de criar
```

Ele vai ler o `Welcome.md` sozinho e te responder.

**O que aprender aqui:** ele já sabe onde está e o que tem em volta. Você não precisa explicar contexto que está nos arquivos.

---

## 2. O primeiro ingest ⭐ (15 min)

**Este é o momento mágico. Não pule.**

1. Ache um artigo que você **leu de verdade** essa semana e achou interessante. Qualquer assunto.
2. Copie o texto dele (ou salve como PDF).
3. Coloque o arquivo dentro da pasta `raw/` do seu vault.
   - No Finder: `Documents/Meu-Vault/raw/`
   - Ou arraste o arquivo direto pra janela do Claude.
4. Volte no Claude e digite:

```
ingest it
```

Agora **assista**. Ele vai:

- ler o arquivo inteiro
- conversar com você sobre o que achou importante
- escrever um resumo com as fontes citadas
- criar páginas separadas pra cada pessoa, empresa e conceito que apareceu
- conectar tudo com links
- atualizar o `index.md` e o `log.md`

Um artigo vira de 5 a 15 páginas conectadas. **Isso é normal.** É esse acúmulo que faz o vault valer a pena.

5. Abra a pasta `wiki/` no Finder e olhe o que apareceu.

**O que aprender aqui:** você não pediu "crie uma página sobre X". Você disse duas palavras. As regras do `Welcome.md` fizeram o resto. Isso é o que "a IA mantém pra você" significa na prática.

---

## 3. A pergunta (5 min)

Agora que tem conteúdo lá dentro:

```
o que a gente sabe sobre [algum tema do artigo]?
```

Ele lê o índice, segue os links e responde **citando as próprias páginas** que acabou de criar.

Faça mais um ingest de outro artigo e pergunte de novo. A resposta fica melhor. É esse o ponto.

**O que aprender aqui:** a diferença entre perguntar pro ChatGPT e perguntar pro seu vault é que aqui a resposta vem das *suas* fontes, e você pode abrir o arquivo e conferir.

---

## 4. Veja seus superpoderes (5 min)

Digite:

```
/plugin
```

Você vai ver os dois plugins instalados. Dá uma olhada no que tem dentro do **superpowers** — são fluxos de trabalho prontos que o Claude segue sozinho quando faz sentido.

Depois digite `/` sozinho e veja a lista de comandos. Não precisa decorar nada.

---

## 5. Deixe ele te entrevistar (20 min)

Pense em algo que você quer fazer. Pode ser qualquer coisa — um site, uma planilha organizada, um plano de viagem, um sistema pra organizar suas receitas.

```
quero fazer [sua ideia]. me ajuda a pensar isso direito antes de começar?
```

O superpowers vai entrar em modo **brainstorming**: ele faz **uma pergunta de cada vez**, entende o que você quer de verdade, propõe caminhos diferentes com os prós e contras, e só depois começa.

**O que aprender aqui:** a maior diferença entre usar IA mal e usar bem não é o prompt perfeito. É deixar ela te fazer perguntas antes de sair fazendo.

---

## Terminou. E agora?

Três hábitos que fazem toda a diferença:

1. **Um ingest por semana.** Achou um artigo bom? Joga no `raw/` e fala "ingest it". Em um mês você tem algo que ninguém mais tem.
2. **Pergunte antes de procurar.** "o que a gente sabe sobre X?" é mais rápido que caçar no Google de novo aquilo que você já leu.
3. **Peça pra ele explicar o que ele fez.** "por que você criou essa página?" — entender as escolhas dele te ensina a dirigir melhor.

E quando travar: [`QUANDO-TRAVAR.md`](./QUANDO-TRAVAR.md).
