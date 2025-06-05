#!/bin/bash

# Exit on error
set -e

# Usage check
if [ -z "$1" ]; then
  echo "❌ Usage: $0 <projects_directory>"
  exit 1
fi

# Input and output directories
PROJECTS_DIR="$1"
BACKUP_DIR="$HOME/env_backups"

# Validate input
if [ ! -d "$PROJECTS_DIR" ]; then
  echo "❌ Error: '$PROJECTS_DIR' is not a valid directory."
  exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Find and backup .env files
find "$PROJECTS_DIR" -type f -name ".env" | while read -r ENV_FILE; do
  # Get directory containing .env
  ENV_DIR=$(dirname "$ENV_FILE")

  # Get path relative to project root
  REL_PATH="${ENV_DIR#$PROJECTS_DIR/}"

  # Destination directory
  DEST_DIR="$BACKUP_DIR/$REL_PATH"
  mkdir -p "$DEST_DIR"

  # Copy the .env file without overwriting existing one
  if [ ! -f "$DEST_DIR/.env" ]; then
    cp "$ENV_FILE" "$DEST_DIR/.env"
    echo "📦 Backed up: $REL_PATH/.env"
  else
    echo "⚠️ Skipped (already exists): $REL_PATH/.env"
  fi
done

echo "✅ Backup completed. Location: $BACKUP_DIR"

