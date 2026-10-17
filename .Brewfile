# Play, record, convert, and stream select audio and video codecs
brew "ffmpeg"
# Infamous electronic fortune-cookie generator
brew "fortune"
# GitHub command-line tool
brew "gh"
# Simple tool to make locally trusted development certificates
brew "mkcert"
# Deep clean and optimize your Mac
brew "mole"
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
