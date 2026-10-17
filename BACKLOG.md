# Backlog

Known quirks & maintenance tasks. Tick `[x]` and move to **Done** (with date) in the fixing commit.
Priority: **Now** = broken or risky · **Soon** = cleanup that pays off · **Someday** = nice to have.

## Now

- [ ] `.zshrc`: delete the Magento Cloud snippet (`BEGIN/END SNIPPET` block) — Magento Cloud no longer used, not installed; its `HOME=${HOME:-'/Users/ronan'}` also hard-codes a home path
- [ ] Vagrant no longer used, not installed: drop `vagrant` from `.zshrc` `plugins=(…)`, `source /home/vagrant/oh-my-git/prompt.sh` in `.bashrc`, the commented line in `functions.sh`
- [ ] `.pathes` gcloud lines: `'$HOME/…'` is single-quoted → never expands; use double quotes (or delete if gcloud unused)
- [ ] `.pathes` Golang: `GOPATH=/usr/local/go/bin` is wrong (GOPATH ≠ Go bin dir); set `GOPATH=$HOME/go`, add `$GOROOT/bin` to PATH
- [ ] `.zshrc`: oh-my-zsh loaded twice (`antigen use oh-my-zsh` + `source $ZSH/oh-my-zsh.sh`) → slower startup; keep one
- [ ] `install.sh`: `ln -s` without `-f` on `.zshrc`, `.pathes`, `.bashrc`, `.vim`, `.zshrc.pre-oh-my-zsh` → fails on re-run
- [ ] Public exposure: move `[user]` + `http.cookiefile` from `.gitconfig` to `~/.gitconfig.local`; drop/move `googleBackup` (work email) and `pim_dump` (DB password) aliases to `~/.bash_aliases.local`

## Soon

- [ ] `.pathes`: remove duplicate npm (`/usr/local/npm_packages`, `~/.npm-packages`) and Python 3.9 blocks
- [ ] `.pathes`: remove dead entries — PHP 7.1, Elasticsearch 5.6, Postgres 9.4, Python 2.7 Cellar, Heroku, LIIP PHP comment
- [ ] `.zshrc`: `archey` check uses Intel path `/usr/local/bin` → use `command -v archey`
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
- [x] 2026-10-17 `.gitconfig`: `http.cookiefile = /Users/ronan/.gitcookies` → `~/.gitcookies` (breaks on the other laptop)
- [x] 2026-10-17 `.gitconfig`: `[include] path = ~/.gitconfig.local` is at the top, so the tracked `[user]` below overrides it → move `[include]` to the end so each laptop's `.local` wins (e.g. work email)
- [x] 2026-10-17 `.bash_aliases`: `phpconsole` hard-coded `/Users/ronan/Workspace/…` → alias removed (php-console + php gone)
- [x] 2026-10-17 `.vimrc:390`: `substitute(getcwd(), '/home/ronan/', …)` → `expand('~') . '/'`
