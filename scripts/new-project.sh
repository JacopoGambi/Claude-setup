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
cp "$TEMPLATE_DIR/CONTEXT.md" "$TARGET/"
cp "$TEMPLATE_DIR/package.json" "$TARGET/"
mkdir -p "$TARGET/docs/adr" "$TARGET/docs/agents" "$TARGET/backup"
cp "$TEMPLATE_DIR"/docs/agents/*.md "$TARGET/docs/agents/"
cp "$TEMPLATE_DIR/backup/SUMMARY.md" "$TARGET/backup/" 2>/dev/null

echo "Progetto creato in: $TARGET"
echo "File copiati: .claude/ CLAUDE.md CONTEXT.md package.json docs/adr/ docs/agents/ backup/SUMMARY.md .gitignore .env.example"
echo ""
echo "Prossimi passi:"
echo "  cd $TARGET"
echo "  claude"
echo "  1. Sostituisci gli script placeholder in package.json"
echo "  2. /grill-with-docs            (tracker locale .scratch/ gia' configurato)"
