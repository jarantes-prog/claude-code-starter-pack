# Welcome — as regras deste vault

Este é um **wiki mantido por IA**. Uma base de conhecimento que cresce e se conecta sozinha: você escolhe as fontes e dirige a análise, a IA faz a burocracia — resumir, cruzar referências, arquivar e manter tudo consistente.

**Você lê; a IA escreve.**

> Este arquivo é o contrato. Tudo que a IA faz aqui dentro segue o que está escrito abaixo. Se você quiser mudar como ela trabalha, mude este arquivo — ou peça pra ela mudar.

---

## As três camadas

1. **Fontes** (`raw/`) — **imutável**. Artigos, PDFs, notas, transcrições, imagens. A IA lê, mas **nunca** modifica nem apaga.
2. **O wiki** (`wiki/`) — markdown escrito pela IA. Resumos, páginas de entidades, de conceitos, análises.
3. **O schema** (este arquivo) — as regras. Evolui com o uso.

---

## Estrutura de pastas

```
Meu-Vault/
├── Welcome.md              ← este arquivo, as regras
├── CLAUDE.md               ← faz o Claude Code carregar o Welcome.md sozinho
├── index.md                ← o catálogo (atualizado em todo ingest)
├── log.md                  ← histórico cronológico, só cresce
├── raw/                    ← FONTES IMUTÁVEIS
│   └── assets/             ← imagens e anexos
└── wiki/                   ← território da IA
    ├── overview/           ← sínteses gerais
    ├── entities/           ← pessoas, lugares, organizações, produtos
    ├── concepts/           ← temas, ideias, frameworks
    ├── sources/            ← um resumo por fonte lida
    └── analysis/           ← comparações, respostas arquivadas, deep dives
```

### Nomes de arquivo

- Páginas usam **Maiúsculas Como Título**, com espaços: `Vannevar Bush.md`, `Conceito de Memex.md`.
- Resumos de fonte levam a data na frente: `2026-07-22 — Título do Artigo.md`.
- Use `[[Links Assim]]` pra conectar páginas.

### Frontmatter (o cabeçalho YAML)

Toda página do wiki começa com:

```yaml
---
type: entity | concept | source | analysis | overview
created: AAAA-MM-DD
updated: AAAA-MM-DD
tags: [tag1, tag2]
sources: ["[[Página da Fonte]]"]
---
```

Páginas de fonte ganham três campos a mais:

```yaml
source_type: article | paper | podcast | book | video | note | conversation
source_url: https://...
source_date: AAAA-MM-DD
```

---

## As três operações

### 1. Ingest — *"ingest it"*

Quando o usuário põe algo em `raw/` e pede pra ingerir:

1. **Leia** a fonte inteira.
2. **Converse** com o usuário sobre os pontos principais **antes de escrever** — confirme o ângulo e a ênfase.
3. **Escreva o resumo** em `wiki/sources/AAAA-MM-DD — Título.md` com: TL;DR de 2 a 4 frases, afirmações principais em bullets, entidades e conceitos como `[[links]]`, citações notáveis, e perguntas em aberto.
4. **Crie ou atualize páginas de entidade** pra cada pessoa/lugar/organização/produto novo. Cada uma termina com `## Aparece em`.
5. **Crie ou atualize páginas de conceito** pra cada ideia nova. Cada uma termina com `## Fontes` e `## Conceitos relacionados`.
6. **Atualize o overview** só quando a fonte nova mudar a visão geral de verdade — não a cada ingest.
7. **Atualize o `index.md`** com as páginas novas e um resumo de uma linha cada.
8. **Anexe ao `log.md`**: `## [AAAA-MM-DD] ingest | Título` e as páginas tocadas.
9. **Reporte no chat**: o que criou, o que mudou, contradições encontradas, e 1 a 3 sugestões de próximas fontes.

Um ingest costuma tocar **5 a 15 páginas**. Isso é normal — é justamente aí que está o valor.

### 2. Query — *"o que a gente sabe sobre X?"*

1. **Leia o `index.md` primeiro** pra achar as páginas candidatas.
2. **Entre nas páginas relevantes**, seguindo os `[[links]]`.
3. **Sintetize com citação explícita**: "Segundo [[Nome da Fonte]]...".
4. **Formate conforme a pergunta**: resposta direta em markdown; comparação em tabela; linha do tempo em lista cronológica.
5. **Arquive respostas boas** em `wiki/analysis/` quando gerarem uma síntese nova que valha guardar. Na dúvida, pergunte.

### 3. Lint — *"faz um check de saúde"*

Procure e reporte: contradições entre páginas, afirmações desatualizadas, páginas órfãs (sem links apontando pra elas), páginas que faltam (conceitos citados mas sem página própria), e lacunas onde uma fonte nova ajudaria.

Entregue o relatório no chat. Se o usuário aprovar as correções, aplique e registre no `log.md`.

---

## Regras de engajamento

1. **A IA é dona de `wiki/`, do índice e do log.** O usuário pode editar à vontade, mas a manutenção é da IA.
2. **`raw/` é imutável.** Nunca sobrescreva nem apague. Só adicione.
3. **Sempre cite.** Toda afirmação no wiki aponta pra uma `[[Fonte]]`. Sem afirmação órfã.
4. **Sinalize contradições, não resolva escondido.** Escreva as duas visões e diga qual fonte sustenta cada uma.
5. **Prefira atualizar página existente a criar nova.** Confira o `index.md` antes.
6. **Atualize `index.md` e `log.md` na mesma passada** que o conteúdo. Nunca deixe desencontrar.
7. **Na dúvida sobre escopo, pergunte.**
8. **Converse antes de escrever** durante ingests.
9. **Resumos curtos.** TL;DR tem de 2 a 4 frases.
10. **O schema evolui.** Se aparecer um jeito melhor de trabalhar, proponha uma mudança neste arquivo.

---

## Uma nota pra quem está começando

Você não precisa entender tudo isso agora. As duas coisas que importam no primeiro dia:

- Ponha um arquivo em `raw/` e diga **"ingest it"**.
- Depois pergunte **"o que a gente sabe sobre X?"**.

O resto vai fazendo sentido sozinho.

Quando quiser uma versão mais avançada deste schema — com camadas de confiança (`canon` vs. `synthesis`) e revisão em cascata — veja o [template completo](https://github.com/jarantes-prog/icm-knowledge-vault).
