#!/usr/bin/env bash
#
# Gera Comecando-com-Claude-Code.html (documento HTML completo, para enviar
# direto pra pessoa) a partir de guia.html.
#
# Por que dois arquivos: guia.html é um FRAGMENTO, feito para ser publicado como
# Artifact — a plataforma injeta <!doctype>, <head> e um reset de CSS. Aberto
# como arquivo local, esse fragmento não declara charset, então o navegador
# adivinha a codificação e os acentos viram mojibake ("ComeÃ§ando"), e sem
# doctype o modo quirks faz a tabela perder a fonte do body.
#
# Rode isto sempre que editar guia.html, para os dois não divergirem.
#
# Generates the standalone document from the artifact fragment. Run after every
# edit to guia.html so the two don't drift.

set -euo pipefail
cd "$(dirname "$0")" || exit 1

python3 - <<'PY'
frag = open('guia.html', encoding='utf-8').read()
open('Comecando-com-Claude-Code.html', 'w', encoding='utf-8').write("""<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="color-scheme" content="light dark">
<style>
  *, *::before, *::after { box-sizing: border-box; }
  body { margin: 0; }
  h1, h2, h3, p, pre, figure { margin: 0; }
  table { font: inherit; border-collapse: collapse; }
</style>
</head>
<body>
""" + frag + """
</body>
</html>
""")
print("✓ Comecando-com-Claude-Code.html gerado")
PY
