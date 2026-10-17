# Backlog

Known quirks & maintenance tasks. Tick `[x]` and move to **Done** (with date) in the fixing commit.
Priority: **Now** = broken or risky · **Soon** = cleanup that pays off · **Someday** = nice to have.

## Now

- [ ] `install.sh`: `ln -s` without `-f` on `.zshrc`, `.pathes`, `.bashrc`, `.vim`, `.zshrc.pre-oh-my-zsh` → fails on re-run
- [ ] Public exposure: move `[user]` + `http.cookiefile` from `.gitconfig` to `~/.gitconfig.local`; drop/move `googleBackup` (work email) and `pim_dump` (DB password) aliases to `~/.bash_aliases.local`

## Soon

- [ ] `.pathes`: remove duplicate npm (`/usr/local/npm_packages`, `~/.npm-packages`) and Python 3.9 blocks
- [ ] `.pathes`: remove dead entries — PHP 7.1, Elasticsearch 5.6, Postgres 9.4, Python 2.7 Cellar, Heroku, LIIP PHP comment
- [ ] `.pathes:19`: `[ -d "/usr/local/bin/php" ]` tests a binary as a dir → always false; use `-x` or drop
- [ ] `.bashrc:158`: `. "$HOME/.local/bin/env"` (uv) unguarded → errors where uv is absent; guard with `[ -f … ]`
- [ ] `.zshrc`: custom fast `git_prompt_info` is defined before oh-my-zsh loads → overwritten by `lib/git.zsh` (omz's async prompt is in use); move it after `source $ZSH/oh-my-zsh.sh` or drop it + update CLAUDE.md
- [ ] `.zshrc`: `zsh-history-substring-search` loaded but no `bindkey` for it → bind ↑/↓ or drop the bundle
- [ ] `.zshrc`: `archey` check uses Intel path `/usr/local/bin` → use `command -v archey`
- [ ] `.zshrc`: ponysay line hard-codes `/opt/homebrew/bin/ponysay` (Apple Silicon prefix) → resolve with `command -v ponysay`, guard if absent
- [ ] `.zshrc`: `EDITOR=/usr/bin/vim` → `vim` (respect Homebrew vim)
- [ ] `.gitmodules`: `snipmate` and `tlib_vim` declared but not in index → remove entries or re-add submodules
- [ ] README: `git://` clone URLs fail on a fresh machine (no gitconfig rewrite yet) → use `https://`
- [ ] README: oh-my-zsh `local.zsh` symlink instructions no longer match how `.zshrc` is installed

## Someday

- [ ] `.bashrc`: Linux-only leftovers (Android SDK paths under `/home/ronan`, `PAGER=most`) → macOS-safe guards or drop
- [ ] `.bash_aliases`: prune apt-get, `ifdown`, `notify-send`, boot2docker, svn, node-webkit aliases; `dl`/`dockerboot`/`gs` defined twice
- [ ] `.zshrc.pre-oh-my-zsh`: probably obsolete → delete + remove from install.sh
- [ ] Vim: most submodules uninitialized; decide keep (init) vs. drop (vim-powerline, phpfolding, vim-behat, vim-symfony are unmaintained)
- [ ] Add `~/.gitconfig.local.example` / `~/.bash_aliases.local.example` templates
- [ ] `.gitconfig`: SourceTree diff/merge tools and `git media` filter likely unused

## Done

<!-- - [x] 2026-10-17 short description -->
- [x] 2026-10-17 `.zshrc`: Magento Cloud snippet deleted (also removed its hard-coded `/Users/ronan` fallback)
- [x] 2026-10-17 Vagrant dropped: `.zshrc` plugin, `.bashrc` oh-my-git source, `functions.sh` comment
- [x] 2026-10-17 `.gitconfig`: `http.cookiefile = /Users/ronan/.gitcookies` → `~/.gitcookies` (breaks on the other laptop)
- [x] 2026-10-17 `.gitconfig`: `[include] path = ~/.gitconfig.local` is at the top, so the tracked `[user]` below overrides it → move `[include]` to the end so each laptop's `.local` wins (e.g. work email)
- [x] 2026-10-17 `.bash_aliases`: `phpconsole` hard-coded `/Users/ronan/Workspace/…` → alias removed (php-console + php gone)
- [x] 2026-10-17 `.zshrc`: oh-my-zsh loaded once (dropped `antigen use oh-my-zsh`, `bundle git`, overridden oh-my-git themes); antigen now after omz, syntax-highlighting last — 0.17s → 0.14s
- [x] 2026-10-17 `.pathes` Golang: dropped bogus `GOPATH=/usr/local/go/bin`, PATH gets `$GOROOT/bin` (GOPATH defaults to `~/go`)
- [x] 2026-10-17 `.pathes` gcloud lines: single quotes → double quotes so `$HOME` expands
- [x] 2026-10-17 `.vimrc:390`: `substitute(getcwd(), '/home/ronan/', …)` → `expand('~') . '/'`
