# ZOUMFX VIP Telegram Bot — 24/7 Cloud Hosting Ready

Professional automated Telegram bot for selling and managing VIP trading memberships (XAUUSD Gold signals), supporting USDT BEP20 manual review, automatic single-use invite link generation (`member_limit=1`), join verification, and automatic expiry member removal.

---

## 📁 Project Structure

```text
├── Dockerfile             # Container definition for 24/7 cloud hosting
├── docker-compose.yml     # Local / VPS Docker orchestration with persistent volume
├── Procfile               # Process file for Heroku / Render / Railway
├── runtime.txt            # Python runtime version specifier
├── requirements.txt       # Python dependencies (python-telegram-bot, apscheduler, etc.)
├── start_bot.sh           # Robust startup wrapper script
├── .dockerignore          # Excluded files for Docker builds
├── .gitignore             # Excluded files for git repository
├── README.md              # Deployment & usage documentation
├── zoumfx_vip_bot.py      # Main Telegram bot entrypoint & handlers
├── zoumfx_vip_config.py   # Plans, prices, wallets & menu copy
├── zoumfx_vip_access.py   # Database schema, invitation hash & expiry queries
├── zoumfx_vip_payments.py # USDT payment submission & automated approval flows
├── zoumfx_vip_usage.py    # SQLite database management, events & settings
└── tests/
    └── test_zoumfx_vip_bot.py # Comprehensive unit test suite
```

---

## 🔑 Required Environment Variables

Add these environment variables on your cloud hosting dashboard:

| Variable Name | Required | Description | Example Value |
| :--- | :--- | :--- | :--- |
| `TELEGRAM_BOT_TOKEN` | **YES** | Bot token from `@BotFather` | `8746003814:AAFBfEJa5bIN7ngX5jju_zu5RxC-DbnJK2A` |
| `ADMIN_TELEGRAM_USER_ID` | **YES** | Your owner Telegram user ID | `6006131461` |
| `VIP_CHANNEL_ID` | **YES** | Numeric ID of your VIP Channel | `-1002973852823` |
| `GEMINI_API_KEY` | Optional | Gemini API key for AI enhancements | `AIzaSy...` |
| `ZOUMFX_VIP_DB_PATH` | Optional | Path to SQLite database | `/app/data/zoumfx_vip_usage.sqlite3` |

---

## 🚀 Exact Deployment Steps

### Option A: Deploy with Docker (Recommended for 24/7 VPS / Coolify / Portainer)

1. **Clone or upload project files** to your server.
2. Create a `.env` file or set environment variables in your hosting panel.
3. Build and run using Docker Compose:
   ```bash
   docker-compose up -d --build
   ```
4. Check running logs:
   ```bash
   docker logs -f zoumfx-vip-bot
   ```

### Option B: Deploy on Railway / Render / Fly.io

1. Connect your GitHub repository to Railway or Render.
2. Add the required Environment Variables (`TELEGRAM_BOT_TOKEN`, `ADMIN_TELEGRAM_USER_ID`, `VIP_CHANNEL_ID`).
3. The platform will automatically detect the `Dockerfile` or `Procfile` and build/deploy your bot to run 24/7 with automatic restarts on crash.

### Option C: Deploy on a Linux VPS (Ubuntu / Debian)

1. Install Docker & Docker Compose on your VPS.
2. Upload the project folder.
3. Run:
   ```bash
   docker-compose up -d --build
   ```

---

## ✨ Core Features & Automation

1. **Automated VIP Plans & Pricing**:
   - Monthly ($5, 1 Month)
   - Half Year ($25, 6 Months)
   - Yearly ($50, 12 Months)
   - Lifetime ($100, Permanent)
2. **Instant USDT BEP20 Payment Review**:
   - Customers submit wallet & screenshot proof.
   - Owner receives interactive inline approve/reject buttons.
3. **Automatic Unique Invitation Links**:
   - On approval, instantly generates a single-use private invite link (`member_limit = 1`, 48-hour expiration).
   - Delivered directly to the customer in private chat.
4. **Join Verification & Expiry Management**:
   - Auto-detects when customers join the VIP channel via invite link.
   - Background worker checks expirations every 60 seconds and automatically removes expired members while preserving Lifetime members.
