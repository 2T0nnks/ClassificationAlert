#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# 1. Check if Python 3.12 is installed
if command_exists python3.12; then
    echo "Python 3.12 is already installed."
else
    echo "Python 3.12 not found. Installing..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository -y ppa:deadsnakes/ppa
    sudo apt install -y python3.12 python3.12-venv python3.12-dev
    echo "Python 3.12 installed."
fi

# 2. Check if docker-compose is installed
if command_exists docker-compose; then
    echo "docker-compose is already installed."
else
    echo "docker-compose not found. Installing..."
    sudo apt update
    sudo apt install -y docker.io
    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "docker-compose installed."
fi

# 3. Install Python dependencies (pip install -r requirements.txt)
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    python3.12 -m pip install --upgrade pip
    python3.12 -m pip install -r requirements.txt
else
    echo "requirements.txt not found. Make sure the file is in the correct directory."
    exit 1
fi

# 4. Start Docker with docker-compose up -d
echo "Starting containers with docker-compose up -d..."
sudo docker-compose up -d

# 5. Run the app with python app.py
if [ -f "app.py" ]; then
    echo "Running python app.py..."
    python3.12 app.py
else
    echo "app.py not found. Make sure the file is in the correct directory."
    exit 1
fi
