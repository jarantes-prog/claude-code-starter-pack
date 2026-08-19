# Quando travar

Primeiro, o truque que resolve 80% dos casos:

> ### Copie a mensagem de erro, cole no Claude e escreva:
> ### *"me explica esse erro em português e me diz exatamente o que fazer"*

Ele é muito bom nisso. Não tenha vergonha de colar erro — é literalmente pra isso que ele serve.

Se não resolver, procure seu caso abaixo.

---

## "command not found: claude"

O Terminal ainda não sabe que o Claude existe.

**Solução:** feche o Terminal por completo (`Cmd + Q`) e abra de novo. Rode a linha do setup outra vez.

---

## "Claude Code requires a Pro, Max, Team or Enterprise account"

Você está no plano gratuito. O Claude Code não funciona nele.

**Solução:** assine em [claude.ai/upgrade](https://claude.ai/upgrade). Depois abra o app e faça login de novo.

---

## Ele pede permissão e eu não sei se digo sim

Isso é de propósito. Ele pergunta antes de mexer em arquivos ou rodar comandos.

**Como decidir:**

| Ele quer... | O que fazer |
|---|---|
| Ler ou escrever dentro da pasta `Meu-Vault` | ✅ Pode deixar |
| Criar páginas em `wiki/` | ✅ É o trabalho dele |
| Mexer em pasta fora do vault | ⚠️ Pergunte antes: *"por que você precisa disso?"* |
| Apagar alguma coisa | ⚠️ Pergunte antes, sempre |
| Rodar um comando que você não entende | ⚠️ Peça: *"me explica esse comando antes"* |

Você **sempre** pode responder "não" e perguntar o porquê. Ele não fica bravo.

---

## Ele fez besteira / escreveu algo errado

Nada aqui é definitivo. Duas saídas:

1. **Fale com ele:** *"isso ficou errado, o certo é X. corrige e me explica o que você entendeu errado."*
2. **Edite você mesma.** É tudo markdown. Abra o arquivo e conserte na mão — o vault é seu.

E se ele apagou algo por acidente: digite `/rewind` para voltar a conversa e os arquivos a um ponto anterior.

---

## "You've reached your usage limit"

Você usou sua cota das últimas 5 horas. Acontece.

**Solução:** espere. A cota volta sozinha. Se acontece sempre, o plano Max tem um limite bem maior.

---

## O app não acha meu vault

**Solução:** no app, aba **Code**, procure o botão de abrir pasta e navegue até `Documents` → `Meu-Vault`. Se a pasta não estiver lá, rode a linha do setup de novo — ele recria o que faltar.

---

## O setup parou no meio

**Solução:** rode a mesma linha de novo.

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/setup.sh | bash
```

O script foi feito pra isso: ele pula tudo que já está pronto, nunca apaga nada, e continua de onde parou.

---

## Nada disso funcionou

1. No Terminal, rode `claude doctor` — ele faz um diagnóstico e sugere correções.
2. Manda print pro João.

---

## Uma coisa pra lembrar

Você não vai quebrar nada. O pior caso realista é uma página de wiki escrita errado, e isso se conserta editando um arquivo de texto.

Pode experimentar à vontade.
