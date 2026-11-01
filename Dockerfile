FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for optimal caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Ensure start script is executable
RUN chmod +x start_bot.sh

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV ZOUMFX_VIP_DB_PATH=/app/data/zoumfx_vip_usage.sqlite3

# Create persistent data volume directory
RUN mkdir -p /app/data

# Run the Telegram bot daemon
CMD ["./start_bot.sh"]
