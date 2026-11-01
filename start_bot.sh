#!/bin/bash
# 24/7 Startup Script for ZOUMFX VIP Telegram Bot
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Ensure data directory exists for SQLite persistence
DB_PATH="${ZOUMFX_VIP_DB_PATH:-zoumfx_vip_usage.sqlite3}"
DB_DIR=$(dirname "$DB_PATH")
if [ "$DB_DIR" != "." ] && [ ! -d "$DB_DIR" ]; then
  mkdir -p "$DB_DIR"
fi

echo "Starting ZOUMFX VIP Telegram Bot..."
exec python3 zoumfx_vip_bot.py
