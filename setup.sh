#!/usr/bin/env bash
#
# claude-comeco — setup para quem nunca usou um terminal.
# claude-comeco — setup for people who have never used a terminal.
#
#   curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-comeco/main/setup.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-comeco/main/setup.sh | bash -s -- --lang en
#
# Este script pode ser rodado quantas vezes quiser. Ele nunca apaga nada.
# This script is safe to run as many times as you like. It never deletes anything.

set -euo pipefail

REPO_OWNER="jarantes-prog"
REPO_NAME="claude-comeco"
REPO_BRANCH="main"
# As três URLs abaixo aceitam override por variável de ambiente — só para testes.
# The three URLs below accept an env-var override — for testing only.
DMG_URL="${CLAUDE_COMECO_DMG_URL:-https://claude.ai/api/desktop/darwin/universal/dmg/latest/redirect}"
INSTALLER_URL="${CLAUDE_COMECO_INSTALLER_URL:-https://claude.ai/install.sh}"
TARBALL_URL="${CLAUDE_COMECO_TARBALL_URL:-}"
MIN_MACOS_MAJOR=13

LANG_CHOICE="pt"
VAULT_DIR=""

while [ $# -gt 0 ]; do
  case "$1" in
    --lang) LANG_CHOICE="${2:-pt}"; shift 2 ;;
    --lang=*) LANG_CHOICE="${1#*=}"; shift ;;
    --vault) VAULT_DIR="${2:-}"; shift 2 ;;
    --vault=*) VAULT_DIR="${1#*=}"; shift ;;
    *) shift ;;
  esac
done

[ "$LANG_CHOICE" = "en" ] || LANG_CHOICE="pt"

# ---------------------------------------------------------------- aparência --

if [ -t 1 ]; then
  BOLD=$'\033[1m'; DIM=$'\033[2m'; GREEN=$'\033[32m'; YELLOW=$'\033[33m'
  RED=$'\033[31m'; BLUE=$'\033[34m'; RESET=$'\033[0m'
else
  BOLD=""; DIM=""; GREEN=""; YELLOW=""; RED=""; BLUE=""; RESET=""
fi

step()  { printf '\n%s▸ %s%s\n' "$BOLD$BLUE" "$1" "$RESET"; }
ok()    { printf '  %s✓%s %s\n' "$GREEN" "$RESET" "$1"; }
skip()  { printf '  %s•%s %s\n' "$DIM" "$RESET" "$1"; }
warn()  { printf '  %s!%s %s\n' "$YELLOW" "$RESET" "$1"; }
die()   { printf '\n%s✗ %s%s\n\n' "$BOLD$RED" "$1" "$RESET" >&2; exit 1; }

# ------------------------------------------------------------------ textos --
# Todo o texto visível fica aqui, para facilitar tradução.
# All user-visible text lives here, to keep translation easy.

if [ "$LANG_CHOICE" = "pt" ]; then
  T_TITLE="Preparando seu Claude Code"
  T_SUB="Isso leva uns 5 minutos. Você só precisa fazer isso uma vez."
  T_ERR_MACOS="Este script só funciona no macOS."
  T_ERR_OLD="Seu macOS é muito antigo (precisa ser 13 ou mais novo). Atualize em Ajustes > Geral > Atualização de Software."
  T_ERR_NET="Não consegui acessar a internet. Verifique sua conexão e tente de novo."
  T_ERR_DL="Não consegui baixar os arquivos. Tente de novo daqui a alguns minutos."
  T_STEP_CHECK="Verificando seu Mac"
  T_OK_MACOS="macOS compatível"
  T_OK_NET="Conexão com a internet OK"
  T_STEP_CLAUDE="Instalando o Claude Code"
  T_SKIP_CLAUDE="Claude Code já estava instalado"
  T_OK_CLAUDE="Claude Code instalado"
  T_ERR_CLAUDE="A instalação do Claude Code falhou. Veja a mensagem acima e me chame."
  T_STEP_PLUGINS="Instalando os plugins"
  T_OK_PLUGIN="Plugin instalado:"
  T_SKIP_PLUGIN="Plugin já estava instalado:"
  T_WARN_PLUGIN="Não consegui instalar agora:"
  T_WARN_PLUGIN2="Sem problema — rode este mesmo comando de novo depois de fazer login no app."
  T_STEP_SETTINGS="Ajustando as configurações"
  T_OK_SETTINGS="Configurações criadas"
  T_SKIP_SETTINGS="Você já tinha configurações — não mexi nelas (cópia de segurança salva)"
  T_STEP_VAULT="Criando seu vault"
  T_OK_VAULT="Vault criado em:"
  T_SKIP_VAULT="Você já tinha um vault aqui — não mexi nele:"
  T_STEP_APP="Baixando o aplicativo do Claude"
  T_OK_APP="Abri o download no seu navegador."
  T_SKIP_APP="O aplicativo Claude já está instalado"
  T_WARN_APP="Não consegui abrir o navegador. Baixe manualmente em: claude.ai/download"
  T_DONE="Pronto!"
  T_NEXT="O que fazer agora"
  T_N1="No navegador, salve o Claude.dmg, abra ele, e arraste o Claude para Aplicativos"
  T_N2="Abra o Claude e faça login (precisa de uma assinatura Pro ou Max)"
  T_N3="Clique na aba Code, no topo"
  T_N4="Abra a pasta"
  T_N5="Leia o arquivo PRIMEIRA-HORA.md — ele te guia pelo resto"
  T_NOTERM="A partir daqui você não precisa mais do Terminal. Pode fechar."
  T_GUIDE="Guia completo:"
else
  T_TITLE="Setting up your Claude Code"
  T_SUB="This takes about 5 minutes. You only ever do it once."
  T_ERR_MACOS="This script only works on macOS."
  T_ERR_OLD="Your macOS is too old (needs to be 13 or newer). Update in Settings > General > Software Update."
  T_ERR_NET="I couldn't reach the internet. Check your connection and try again."
  T_ERR_DL="I couldn't download the files. Try again in a few minutes."
  T_STEP_CHECK="Checking your Mac"
  T_OK_MACOS="macOS is compatible"
  T_OK_NET="Internet connection OK"
  T_STEP_CLAUDE="Installing Claude Code"
  T_SKIP_CLAUDE="Claude Code was already installed"
  T_OK_CLAUDE="Claude Code installed"
  T_ERR_CLAUDE="Claude Code installation failed. Check the message above and ask for help."
  T_STEP_PLUGINS="Installing plugins"
  T_OK_PLUGIN="Plugin installed:"
  T_SKIP_PLUGIN="Plugin was already installed:"
  T_WARN_PLUGIN="Couldn't install right now:"
  T_WARN_PLUGIN2="No problem — run this same command again after logging into the app."
  T_STEP_SETTINGS="Applying settings"
  T_OK_SETTINGS="Settings created"
  T_SKIP_SETTINGS="You already had settings — left them alone (backup saved)"
  T_STEP_VAULT="Creating your vault"
  T_OK_VAULT="Vault created at:"
  T_SKIP_VAULT="You already had a vault here — left it alone:"
  T_STEP_APP="Downloading the Claude app"
  T_OK_APP="Opened the download in your browser."
  T_SKIP_APP="The Claude app is already installed"
  T_WARN_APP="Couldn't open the browser. Get it manually at: claude.ai/download"
  T_DONE="All done!"
  T_NEXT="What to do now"
  T_N1="In your browser, save Claude.dmg, open it, and drag Claude into Applications"
  T_N2="Open Claude and log in (you need a Pro or Max subscription)"
  T_N3="Click the Code tab at the top"
  T_N4="Open the folder"
  T_N5="Read FIRST-HOUR.md — it walks you through the rest"
  T_NOTERM="From here on you don't need the Terminal. You can close it."
  T_GUIDE="Full guide:"
fi

if [ -z "$VAULT_DIR" ]; then
  if [ "$LANG_CHOICE" = "pt" ]; then
    VAULT_DIR="$HOME/Documents/Meu-Vault"
  else
    VAULT_DIR="$HOME/Documents/My-Vault"
  fi
fi

printf '\n%s%s%s\n' "$BOLD" "$T_TITLE" "$RESET"
printf '%s%s%s\n' "$DIM" "$T_SUB" "$RESET"

# ------------------------------------------------------------ 1. preflight --

step "$T_STEP_CHECK"

[ "$(uname -s)" = "Darwin" ] || die "$T_ERR_MACOS"

macos_major="$(sw_vers -productVersion | cut -d. -f1)"
[ "$macos_major" -ge "$MIN_MACOS_MAJOR" ] || die "$T_ERR_OLD"
ok "$T_OK_MACOS ($(sw_vers -productVersion))"

# Checamos o próprio instalador, não a home do claude.ai — a home devolve 403
# para o curl (bloqueio de bot), o que daria falso negativo em todo mundo.
# We probe the installer itself, not the claude.ai homepage — the homepage returns
# 403 to curl (bot protection), which would be a false negative for everyone.
curl -fsSL --max-time 20 -o /dev/null "$INSTALLER_URL" 2>/dev/null || die "$T_ERR_NET"
ok "$T_OK_NET"

# ------------------------------------------------------- 2. install claude --

step "$T_STEP_CLAUDE"

# O instalador coloca o claude em ~/.local/bin, que pode não estar no PATH ainda.
# The installer puts claude in ~/.local/bin, which may not be on PATH yet.
export PATH="$HOME/.local/bin:$PATH"

if command -v claude >/dev/null 2>&1; then
  skip "$T_SKIP_CLAUDE ($(claude --version 2>/dev/null | awk '{print $1}'))"
else
  curl -fsSL "$INSTALLER_URL" | bash || die "$T_ERR_CLAUDE"
  hash -r 2>/dev/null || true
  export PATH="$HOME/.local/bin:$PATH"
  command -v claude >/dev/null 2>&1 || die "$T_ERR_CLAUDE"
  ok "$T_OK_CLAUDE ($(claude --version 2>/dev/null | awk '{print $1}'))"
fi

# ------------------------------------------------------------ 3. settings --
# ORDEM IMPORTA: isto vem ANTES dos plugins. O `claude plugin install` cria o
# settings.json sozinho, então se rodássemos depois nunca escreveríamos as
# proteções num Mac novo — o arquivo já existiria.
# ORDER MATTERS: this runs BEFORE plugins. `claude plugin install` creates
# settings.json itself, so running after would mean never writing the
# protections on a fresh Mac — the file would already exist.
#
# Nunca sobrescrevemos um settings.json existente. Só criamos se não houver.
# We never overwrite an existing settings.json. We only create one if absent.

step "$T_STEP_SETTINGS"

mkdir -p "$HOME/.claude"
SETTINGS="$HOME/.claude/settings.json"

if [ -f "$SETTINGS" ]; then
  cp "$SETTINGS" "${SETTINGS}.backup-$(date +%Y%m%d-%H%M%S)"
  skip "$T_SKIP_SETTINGS"
else
  cat > "$SETTINGS" <<'JSON'
{
  "permissions": {
    "deny": [
      "Read(**/.env)",
      "Read(**/.env.*)",
      "Read(**/*.pem)",
      "Read(**/*.key)",
      "Read(**/id_rsa)",
      "Read(**/id_ed25519)",
      "Read(**/.ssh/**)",
      "Read(**/.aws/credentials)",
      "Read(**/credentials.json)",
      "Edit(**/.env)",
      "Edit(**/.env.*)",
      "Write(**/.env)",
      "Write(**/.env.*)"
    ]
  },
  "autoUpdatesChannel": "stable"
}
JSON
  ok "$T_OK_SETTINGS"
fi

# ---------------------------------------------------------- 4. os plugins --
# Só dois. Uma pessoa começando se perde com quarenta skills.
# Only two. Someone starting out drowns in forty skills.

step "$T_STEP_PLUGINS"

claude plugin marketplace add "anthropics/claude-plugins-official" >/dev/null 2>&1 || true

installed_plugins="$(claude plugin list 2>/dev/null || true)"

for plugin in superpowers skill-creator; do
  if printf '%s' "$installed_plugins" | grep -q "$plugin"; then
    skip "$T_SKIP_PLUGIN $plugin"
  elif claude plugin install "${plugin}@claude-plugins-official" --scope user >/dev/null 2>&1; then
    ok "$T_OK_PLUGIN $plugin"
  else
    warn "$T_WARN_PLUGIN $plugin"
    warn "$T_WARN_PLUGIN2"
  fi
done

# --------------------------------------------------------------- 5. vault --
# Baixamos um tarball em vez de usar git: `git` num Mac limpo dispara a
# instalação gráfica do Xcode Command Line Tools e trava a pessoa.
# We download a tarball instead of using git: `git` on a clean Mac triggers
# the Xcode Command Line Tools GUI prompt and strands the user.

step "$T_STEP_VAULT"

if [ -d "$VAULT_DIR" ]; then
  skip "$T_SKIP_VAULT $VAULT_DIR"
else
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT

  tarball="${TARBALL_URL:-https://codeload.github.com/${REPO_OWNER}/${REPO_NAME}/tar.gz/refs/heads/${REPO_BRANCH}}"
  curl -fsSL --max-time 60 "$tarball" -o "$TMP/kit.tar.gz" || die "$T_ERR_DL"
  tar -xzf "$TMP/kit.tar.gz" -C "$TMP" || die "$T_ERR_DL"

  src="$TMP/${REPO_NAME}-${REPO_BRANCH}"
  [ -d "$src/vault/$LANG_CHOICE" ] || die "$T_ERR_DL"

  mkdir -p "$(dirname "$VAULT_DIR")"
  cp -R "$src/vault/$LANG_CHOICE" "$VAULT_DIR"

  # Os guias ficam dentro do vault para ela nunca os perder de vista.
  # The guides live inside the vault so she can never lose track of them.
  if [ "$LANG_CHOICE" = "pt" ]; then
    cp "$src/PRIMEIRA-HORA.md" "$src/QUANDO-TRAVAR.md" "$VAULT_DIR/" 2>/dev/null || true
  else
    cp "$src/FIRST-HOUR.md" "$src/WHEN-STUCK.md" "$VAULT_DIR/" 2>/dev/null || true
  fi

  # .gitkeep só existe para o git preservar as pastas vazias no repositório.
  # .gitkeep only exists so git preserves the empty folders in the repo.
  find "$VAULT_DIR" -name .gitkeep -delete 2>/dev/null || true

  ok "$T_OK_VAULT $VAULT_DIR"
fi

# ----------------------------------------------------------- 6. o app .dmg --

step "$T_STEP_APP"

if [ -d "/Applications/Claude.app" ]; then
  skip "$T_SKIP_APP"
else
  # Entregamos o download ao navegador em vez de baixar com curl. A URL do .dmg
  # fica atrás de proteção anti-bot: o curl recebe uma página HTML de desafio
  # (~5 KB) em vez do instalador, e como o arquivo não fica vazio, a checagem
  # passaria e abriríamos um HTML disfarçado de .dmg. O navegador passa normal.
  # We hand the download to the browser instead of fetching with curl. The .dmg
  # URL sits behind bot protection: curl receives an HTML challenge page (~5 KB)
  # instead of the installer, and since that file isn't empty the check would
  # pass and we'd open an HTML file masquerading as a .dmg. The browser is fine.
  if open "$DMG_URL" 2>/dev/null; then
    ok "$T_OK_APP"
  else
    warn "$T_WARN_APP"
  fi
fi

# ------------------------------------------------------------- 7. o final --

printf '\n%s%s %s%s\n' "$BOLD$GREEN" "✓" "$T_DONE" "$RESET"
printf '\n%s%s:%s\n' "$BOLD" "$T_NEXT" "$RESET"
printf '  1. %s\n' "$T_N1"
printf '  2. %s\n' "$T_N2"
printf '  3. %s\n' "$T_N3"
printf '  4. %s %s\n' "$T_N4" "$VAULT_DIR"
printf '  5. %s\n' "$T_N5"
printf '\n%s%s%s\n' "$DIM" "$T_NOTERM" "$RESET"
printf '%s%s https://github.com/%s/%s%s\n\n' "$DIM" "$T_GUIDE" "$REPO_OWNER" "$REPO_NAME" "$RESET"

open "$VAULT_DIR" 2>/dev/null || true
