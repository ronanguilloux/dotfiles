# Play, record, convert, and stream select audio and video codecs
brew "ffmpeg"
# Infamous electronic fortune-cookie generator
brew "fortune"
# GitHub command-line tool
brew "gh"
# Distributed revision control system
brew "git"
# Git extension for versioning large files
brew "git-lfs"
# Lightweight and flexible command-line JSON processor
brew "jq"
# Simple tool to make locally trusted development certificates
brew "mkcert"
# Deep clean and optimize your Mac
brew "mole"
# Open-source, cross-platform JavaScript runtime environment
brew "node"
# PNG file optimizer
brew "optipng"
# PNG image optimizing utility
brew "pngquant"
# Cowsay but with ponies
brew "ponysay"
# PDF rendering library (based on the xpdf-3.0 code base)
brew "poppler"
# CLI proxy to minimize LLM token consumption
brew "rtk"
# Text interface for Git repositories
brew "tig"
# Display directories as trees (with optional color/HTML output)
brew "tree"
# Extremely fast Python package installer and resolver, written in Rust
brew "uv"
# Executes a program periodically, showing output fullscreen
brew "watch"
# Zsh port of Fish shell's history search
brew "zsh-history-substring-search"
# Fish shell like syntax highlighting for zsh
brew "zsh-syntax-highlighting"
# Reverse proxy, secure introspectable tunnels to localhost
cask "ngrok"
uv "apple-books-mcp"
uv "graphifyy"
uv "maigret", source: "git+https://github.com/soxoj/maigret.git"
npm "@google/gemini-cli"

# Machine-only tools (untracked)
local = File.expand_path("~/.Brewfile.local")
instance_eval(File.read(local)) if File.exist?(local)
