# Começando com Claude Code

**Um kit para quem nunca abriu um terminal na vida.**

🇬🇧 [English version](./README.en.md)

Você vai sair daqui com o Claude Code instalado no seu Mac, dois plugins bons já configurados, e um *vault* — uma base de conhecimento que a IA mantém pra você — pronto pra usar.

Leva uns 5 minutos. Você abre o Terminal **uma vez** e nunca mais.

---

## Antes de começar: você precisa de uma assinatura

O Claude Code **não funciona no plano gratuito**. Você precisa do **Claude Pro** (~US$20/mês) ou **Max**.

👉 Assine em [claude.ai/upgrade](https://claude.ai/upgrade) antes de continuar. Sem isso, nada aqui vai funcionar.

---

## O passo único

1. Aperte `Cmd + Espaço`, digite **Terminal**, aperte `Enter`.
2. Cole a linha abaixo e aperte `Enter`:

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-comeco/main/setup.sh | bash
```

3. Espere. O script vai te contar tudo o que está fazendo, em português.

Quando terminar, ele abre a janela de instalação do app e a pasta do seu vault. Aí é só seguir os 5 passos que aparecem na tela.

> **Deu erro?** Rode a mesma linha de novo. O script foi feito pra ser repetido — ele nunca apaga nada e pula o que já está pronto.

---

## Depois: leia o `PRIMEIRA-HORA.md`

Essa é a parte que importa de verdade. São 5 exercícios curtos que te levam de "instalei" até "entendi pra que serve". Ele já está dentro da pasta do seu vault.

📄 Prefere um guia visual pra imprimir? Veja [`guia.html`](./guia.html).

---

## O que o script faz (nada escondido)

Esse projeto acredita em **glass-box**: você tem o direito de saber o que rodou na sua máquina. O [`setup.sh`](./setup.sh) inteiro está aqui pra você ler. Em resumo, ele:

| # | O que faz | Por quê |
|---|---|---|
| 1 | Confere se seu Mac é compatível (macOS 13+) e se tem internet | Falhar cedo com uma mensagem clara é melhor que falhar no meio |
| 2 | Instala o Claude Code pelo instalador oficial da Anthropic | Se atualiza sozinho depois. Sem Homebrew, sem Node |
| 3 | Instala 2 plugins: `superpowers` e `skill-creator` | Só dois. Quarenta skills afogam quem está começando |
| 4 | Cria um `settings.json` com proteções básicas | Impede que a IA leia suas senhas e chaves por acidente |
| 5 | Cria seu vault em `~/Documents/Meu-Vault` | Sua base de conhecimento |
| 6 | Baixa o app do Claude e abre a janela de instalação | Pra você não ter que procurar |

**O que ele NÃO faz:** não apaga arquivos, não pede sua senha de administrador, não instala Homebrew nem Node, e não mexe em configurações que já existam (faz uma cópia de segurança antes).

---

## Por que o app e o Terminal?

O Claude Code tem duas caras, e as duas leem a **mesma configuração**:

- **O aplicativo** (aba **Code**) — é onde você vai viver. Janelas, botões, arrastar arquivo. Nada de terminal.
- **O comando de terminal** — o script usa só como encanamento, pra instalar os plugins.

Ou seja: o Terminal faz o trabalho sujo uma vez, e você fica com o app bonito pra sempre.

---

## O que é esse tal de "vault"?

Uma pasta com regras. Você joga coisas em `raw/` (um artigo, um PDF, uma transcrição) e diz **"ingest it"**. O Claude lê, resume, cria páginas conectadas, cita as fontes e atualiza o índice.

```
Meu-Vault/
├── Welcome.md    ← as regras que o Claude segue
├── index.md      ← o catálogo de tudo
├── log.md        ← o histórico do que mudou
├── raw/          ← VOCÊ põe as fontes aqui (o Claude nunca apaga)
└── wiki/         ← o Claude escreve aqui
```

A ideia: **você lê, a IA escreve.** Cada fonte nova se conecta às anteriores, então o valor *acumula*. É a metodologia **ICM** (Interpretable Context Methodology) — pastas em vez de agentes, tudo em markdown legível, sem caixa-preta.

Funciona pra qualquer assunto: um mercado que você acompanha, um hobby, pesquisa da faculdade, clientes.

---

## Travou?

Leia o [`QUANDO-TRAVAR.md`](./QUANDO-TRAVAR.md). E lembra do truque mais útil de todos:

> **Copie a mensagem de erro, cole no Claude e peça: "me explica esse erro em português e me diz o que fazer".**

Ele é bom nisso. Sério.

---

## Créditos e licença

- **ICM / "folders over agents"** — Jake Van Clief ([Clief Notes](https://www.skool.com/cliefnotes))
- **Template original do vault** — [icm-knowledge-vault](https://github.com/jarantes-prog/icm-knowledge-vault)
- **superpowers** — plugin oficial da Anthropic

MIT. Pega, forka, manda pros seus amigos.
