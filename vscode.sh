#!/usr/bin/env bash
#
# vscode.sh — passo opcional "nível 2": Claude Code dentro do VS Code.
# vscode.sh — optional "level 2" step: Claude Code inside VS Code.
#
#   curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/vscode.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/jarantes-prog/claude-code-starter-pack/main/vscode.sh | bash -s -- --lang en
#
# Pode ser rodado quantas vezes quiser. Ele nunca apaga nada.
# This script is safe to run as many times as you like. It never deletes anything.

set -euo pipefail

EXT_ID="anthropic.claude-code"
MIN_MACOS_MAJOR=13
# URLs abaixo aceitam override por variável de ambiente — só para testes.
# The URLs below accept an env-var override — for testing only.
VSCODE_URL_ARM64="${VSCODE_ARM64_URL:-https://update.code.visualstudio.com/latest/darwin-arm64/stable}"
VSCODE_URL_INTEL="${VSCODE_INTEL_URL:-https://update.code.visualstudio.com/latest/darwin/stable}"

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
  T_TITLE="Instalando o Claude Code no VS Code"
  T_SUB="Um passo opcional, pra quando você quiser mais poder. Leva uns minutos."
  T_ERR_MACOS="Este script só funciona no macOS."
  T_ERR_OLD="Seu macOS é muito antigo (precisa ser 13 ou mais novo)."
  T_ERR_NET="Não consegui baixar o VS Code. Verifique sua internet e tente de novo."
  T_STEP_VSCODE="Baixando o VS Code"
  T_DL_BIG="O VS Code tem uns 300 MB — pode demorar um pouco. Deixa rodando."
  T_SKIP_VSCODE="O VS Code já estava instalado"
  T_OK_VSCODE="VS Code instalado em:"
  T_WARN_MOVE="Não consegui mover pro /Applications. Deixei aqui — arraste pra Aplicativos:"
  T_STEP_EXT="Instalando a extensão do Claude Code"
  T_OK_EXT="Extensão instalada:"
  T_SKIP_EXT="A extensão já estava instalada"
  T_WARN_EXT="Não consegui instalar a extensão agora. Abra o VS Code, e no próximo passo ela se instala sozinha."
  T_STEP_OPEN="Abrindo seu vault no VS Code"
  T_OK_OPEN="Abri o VS Code."
  T_SKIP_OPEN="Não achei um vault pra abrir aqui — sem problema, você abre a pasta você mesmo."
  T_DONE="Pronto!"
  T_NEXT="O que fazer agora"
  T_N1="No VS Code, ache o ícone ✱ Claude Code (na barra lateral esquerda ou no topo) e clique"
  T_N2="Faça login com a sua conta (a mesma assinatura Pro ou Max)"
  T_N3="Pronto — agora você conversa com o Claude ali mesmo, vendo os arquivos do lado"
else
  T_TITLE="Setting up Claude Code in VS Code"
  T_SUB="An optional step, for when you want more power. Takes a few minutes."
  T_ERR_MACOS="This script only works on macOS."
  T_ERR_OLD="Your macOS is too old (needs to be 13 or newer)."
  T_ERR_NET="I couldn't download VS Code. Check your internet and try again."
  T_STEP_VSCODE="Downloading VS Code"
  T_DL_BIG="VS Code is around 300 MB — this can take a bit. Let it run."
  T_SKIP_VSCODE="VS Code was already installed"
  T_OK_VSCODE="VS Code installed at:"
  T_WARN_MOVE="Couldn't move it to /Applications. Left it here — drag it into Applications:"
  T_STEP_EXT="Installing the Claude Code extension"
  T_OK_EXT="Extension installed:"
  T_SKIP_EXT="The extension was already installed"
  T_WARN_EXT="Couldn't install the extension right now. Open VS Code — it installs itself on the next step."
  T_STEP_OPEN="Opening your vault in VS Code"
  T_OK_OPEN="Opened VS Code."
  T_SKIP_OPEN="Didn't find a vault to open here — no problem, just open the folder yourself."
  T_DONE="All done!"
  T_NEXT="What to do now"
  T_N1="In VS Code, find the ✱ Claude Code icon (left side bar or top) and click it"
  T_N2="Sign in with your account (the same Pro or Max subscription)"
  T_N3="That's it — now you chat with Claude right there, with your files beside it"
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

[ "$(uname -s)" = "Darwin" ] || die "$T_ERR_MACOS"
macos_major="$(sw_vers -productVersion | cut -d. -f1)"
[ "$macos_major" -ge "$MIN_MACOS_MAJOR" ] || die "$T_ERR_OLD"

APP="/Applications/Visual Studio Code.app"
USER_APP="$HOME/Applications/Visual Studio Code.app"

# ------------------------------------------------------- 2. install vscode --
# Baixamos o zip oficial e descompactamos com `ditto` (jeito nativo do macOS,
# preserva o pacote .app direitinho). O zip é baixável por curl — sem o bloqueio
# anti-bot que o .dmg do Claude tem.
# We download the official zip and unpack it with `ditto` (the native macOS way,
# which preserves the .app bundle correctly). The zip is curl-able — no bot
# challenge like the Claude .dmg.

step "$T_STEP_VSCODE"

if [ -d "$APP" ] || [ -d "$USER_APP" ]; then
  [ -d "$APP" ] || APP="$USER_APP"
  skip "$T_SKIP_VSCODE"
else
  if [ "$(uname -m)" = "arm64" ]; then url="$VSCODE_URL_ARM64"; else url="$VSCODE_URL_INTEL"; fi
  warn "$T_DL_BIG"

  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT

  curl -fL --max-time 900 "$url" -o "$TMP/vscode.zip" || die "$T_ERR_NET"
  ditto -x -k "$TMP/vscode.zip" "$TMP/extracted" 2>/dev/null \
    || unzip -q "$TMP/vscode.zip" -d "$TMP/extracted" \
    || die "$T_ERR_NET"

  src="$(/usr/bin/find "$TMP/extracted" -maxdepth 2 -name 'Visual Studio Code.app' -type d | head -1)"
  [ -n "$src" ] || die "$T_ERR_NET"

  if mv "$src" "/Applications/" 2>/dev/null; then
    APP="/Applications/Visual Studio Code.app"
    ok "$T_OK_VSCODE /Applications"
  else
    mkdir -p "$HOME/Applications"
    mv "$src" "$HOME/Applications/" 2>/dev/null || die "$T_ERR_NET"
    APP="$HOME/Applications/Visual Studio Code.app"
    warn "$T_WARN_MOVE $APP"
  fi
fi

# ---------------------------------------------------------- 3. a extensão --
# O VS Code traz um binário `code` dentro do próprio app, então instalamos a
# extensão por esse caminho absoluto — sem depender do `code` estar no PATH.
# VS Code ships a `code` binary inside the app bundle, so we install the
# extension via that absolute path — no dependency on `code` being on PATH.

step "$T_STEP_EXT"

CODE_BIN="$APP/Contents/Resources/app/bin/code"
if [ -x "$CODE_BIN" ]; then
  if "$CODE_BIN" --list-extensions 2>/dev/null | grep -qixF "$EXT_ID"; then
    skip "$T_SKIP_EXT"
  elif "$CODE_BIN" --install-extension "$EXT_ID" --force >/dev/null 2>&1; then
    ok "$T_OK_EXT $EXT_ID"
  else
    warn "$T_WARN_EXT"
  fi
else
  warn "$T_WARN_EXT"
fi

# ------------------------------------------------------------- 4. o vault --

step "$T_STEP_OPEN"

if [ -d "$VAULT_DIR" ]; then
  open -a "$APP" "$VAULT_DIR" 2>/dev/null || open -a "Visual Studio Code" "$VAULT_DIR" 2>/dev/null || true
  ok "$T_OK_OPEN"
else
  skip "$T_SKIP_OPEN"
fi

# ------------------------------------------------------------- 5. o final --

printf '\n%s%s %s%s\n' "$BOLD$GREEN" "✓" "$T_DONE" "$RESET"
printf '\n%s%s:%s\n' "$BOLD" "$T_NEXT" "$RESET"
printf '  1. %s\n' "$T_N1"
printf '  2. %s\n' "$T_N2"
printf '  3. %s\n' "$T_N3"
printf '\n'
