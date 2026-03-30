#!/bin/bash
# Crea un nuovo progetto con la configurazione Claude Code
# Uso: ./new-project.sh <percorso-progetto>

TEMPLATE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$1"

if [ -z "$TARGET" ]; then
  echo "Uso: ./new-project.sh <percorso-progetto>"
  echo "Esempio: ./new-project.sh ~/Desktop/mio-sito-web"
  exit 1
fi

if [ -d "$TARGET/.claude" ]; then
  echo "Errore: $TARGET/.claude esiste gia'. Vuoi sovrascrivere? (s/n)"
  read -r risposta
  [ "$risposta" != "s" ] && echo "Annullato." && exit 0
fi

mkdir -p "$TARGET"
cp -r "$TEMPLATE_DIR/.claude" "$TARGET/"
cp "$TEMPLATE_DIR/CLAUDE.md" "$TARGET/"
cp "$TEMPLATE_DIR/.gitignore" "$TARGET/"
cp "$TEMPLATE_DIR/.env.example" "$TARGET/" 2>/dev/null

echo "Progetto creato in: $TARGET"
echo "File copiati: .claude/ CLAUDE.md .gitignore"
echo ""
echo "Prossimi passi:"
echo "  cd $TARGET"
echo "  claude"
