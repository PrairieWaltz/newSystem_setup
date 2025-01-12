#!/bin/bash

# GitHub repository URL
REPO_URL="https://github.com/PrairieWaltz/confVault"
CLONE_DIR="$HOME/confVault"

# Backup directory for existing configurations
BACKUP_DIR="$HOME/config_backup"
mkdir -p "$BACKUP_DIR"

# Files to configure
TARGETS=(
    ".bashrc"
    ".tmux.conf"
    ".tmux.conf.local"
    ".zshrc"
)

echo "Starting configuration setup..."

# Clone the repository
if [[ -d "$CLONE_DIR" ]]; then
    echo "Repository already exists at $CLONE_DIR. Pulling latest changes..."
    git -C "$CLONE_DIR" pull
else
    echo "Cloning repository from $REPO_URL to $CLONE_DIR..."
    git clone "$REPO_URL" "$CLONE_DIR"
fi

# Install Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Process each configuration file
for FILE in "${TARGETS[@]}"; do
    SOURCE_FILE="$CLONE_DIR/$FILE"
    TARGET_FILE="$HOME/$FILE"
    
    if [[ -f "$SOURCE_FILE" ]]; then
        # Backup existing file
        if [[ -f "$TARGET_FILE" ]]; then
            echo "Backing up existing $FILE to $BACKUP_DIR"
            cp "$TARGET_FILE" "$BACKUP_DIR/"
        fi
        
        # Copy the new file
        echo "Installing $FILE to $HOME"
        cp "$SOURCE_FILE" "$TARGET_FILE"
    else
        echo "Warning: $FILE not found in repository. Skipping."
    fi
done

# Reload shell configurations
echo "Reloading shell configurations..."
if [[ -f "$HOME/.bashrc" ]]; then
    source "$HOME/.bashrc"
fi

if [[ -f "$HOME/.zshrc" ]]; then
    source "$HOME/.zshrc"
fi

# Reload tmux configuration
if command -v tmux &>/dev/null; then
    echo "Reloading tmux configuration..."
    tmux source-file "$HOME/.tmux.conf"
fi

echo "Configuration setup complete."
