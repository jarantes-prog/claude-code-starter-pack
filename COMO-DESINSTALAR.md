# Como desinstalar

Mudou de ideia, ou só quer limpar tudo? Tranquilo. Dá pra remover em uns dois minutos, e nada aqui é perigoso.

> **O mais importante:** seu **vault** (a pasta com as suas anotações) é **seu**. Os passos 1 e 2 abaixo **não tocam nele**. Só apague o vault se você quiser mesmo — é o passo 3, separado e avisado.

---

## 1. Remova o aplicativo

1. Se o Claude estiver aberto, feche por completo (`Cmd + Q`).
2. No Finder, vá em **Aplicativos**, ache o **Claude** e arraste pra Lixeira.

---

## 2. Remova o Claude Code (o comando, as configurações e os plugins)

Abra o Terminal (`Cmd + Espaço`, digite **Terminal**, `Enter`) e cole estas duas linhas, uma de cada vez:

```bash
rm -rf ~/.claude
rm -f ~/.local/bin/claude
```

O que cada uma faz:

- `~/.claude` — todas as configurações, plugins e histórico do Claude Code (tudo, não só deste kit).
- `~/.local/bin/claude` — o comando `claude` em si.

Se você quiser tirar também as versões que ele guardou pra se atualizar (existe só em algumas instalações — sem problema se não existir):

```bash
rm -rf ~/.local/share/claude
```

> Não sabe se um arquivo existe? Pode rodar a linha mesmo assim — se não existir, ela não faz nada e não dá erro.

---

## 3. (Opcional) Remova o seu vault

⚠️ **Isto apaga as suas anotações, e não dá pra desfazer.** Só faça se tiver certeza.

```bash
rm -rf ~/Documents/Meu-Vault
```

Criou o vault em outro lugar? Troque o caminho pelo lugar certo.

---

## 4. (Opcional) Limpe o PATH

O instalador pode ter adicionado uma linha no seu `~/.zshrc` pra achar o comando. É inofensivo deixar. Se quiser tirar, abra o arquivo com `open -e ~/.zshrc` e apague a linha que menciona `.local/bin`.

---

## Pronto

Foi só isso. Se um dia quiser voltar, é a mesma linha de sempre:

```bash
curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/setup.sh | bash
```
