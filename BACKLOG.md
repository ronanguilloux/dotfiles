# Backlog

Known quirks & maintenance tasks. Tick `[x]` and move to **Done** (with date) in the fixing commit.
Priority: **Now** = broken or risky · **Soon** = cleanup that pays off · **Someday** = nice to have.

## Now

Nothing urgent.

## Soon

Nothing left.

## Someday

- [ ] `.bashrc`: Linux-only leftovers (Android SDK paths under `/home/ronan`, `PAGER=most`) → macOS-safe guards or drop
- [ ] `.bash_aliases`: prune apt-get, `ifdown`, `notify-send`, boot2docker, svn, node-webkit aliases; `dl`/`dockerboot`/`gs` defined twice
- [ ] `.zshrc.pre-oh-my-zsh`: probably obsolete → delete + remove from install.sh
- [ ] `install.sh`: if `~/.vim-dist` already exists, `mv ~/.vim ~/.vim-dist` nests the dir inside it instead of replacing
- [ ] Vim: most submodules uninitialized; decide keep (init) vs. drop (vim-powerline, phpfolding, vim-behat, vim-symfony are unmaintained); keeping vim-snipmate may mean re-adding its `tlib_vim` dependency
- [ ] Add `~/.gitconfig.local.example` / `~/.bash_aliases.local.example` templates
- [ ] `.gitconfig`: SourceTree diff/merge tools and `git media` filter likely unused

## Done

<!-- - [x] 2026-10-17 short description -->
- [x] 2026-10-17 gcloud completion never worked: antigen's cache stubs `compdef` and re-runs `compinit` at the first prompt, wiping completions registered after it → `.zshrc` runs `_antigen_compinit` right after `antigen apply`. `.pathes` also picks up `~/Downloads/google-cloud-sdk` (installer's hard-coded `/Users/…` lines dropped). Tested on home laptop
- [x] 2026-10-17 README: `git://` → `https://` clone URLs; dropped the antigen clone (vendored) and the obsolete omz `local.zsh` symlink section
- [x] 2026-10-17 `.zshrc` gcloud completion: `'$HOME/…'` → `"$HOME/…"`; duplicate completion line dropped from `.pathes` (ran before compinit) — untested, no gcloud on home laptop
- [x] 2026-10-17 `.gitmodules`: dropped `snipmate` (superseded by `vim-snipmate`) and `tlib_vim`, both declared but never in the index
- [x] 2026-10-17 `.zshrc` startup quirks: dropped the custom `git_prompt_info` (omz redefined it anyway; its async prompt is already non-blocking) and the duplicate `compinit -i`; ↑/↓ bound to history-substring-search; `archey`/`ponysay` found via `command -v` and guarded; `EDITOR=vim`
- [x] 2026-10-17 `.bashrc`: uv's `~/.local/bin/env` sourced only if present
- [x] 2026-10-17 `.pathes`: dropped dead blocks (Heroku, PHP 7.1, Elasticsearch 5.6, Postgres 9.4, Python 2.7 Cellar, LIIP comment, always-false `/usr/local/bin/php` test) and the first copy of the duplicated npm / Python 3.9 blocks — resulting PATH unchanged (home laptop)
- [x] 2026-10-17 Public exposure: dead `googleBackup` (work email) and `pim_dump` (DB password) aliases deleted. `[user]` and `http.cookiefile` stay tracked on purpose: the name/email already appear in every public commit, the cookiefile path is just `~/`, and `~/.gitconfig.local` (included last) overrides both
- [x] 2026-10-17 antigen: stale `~/.antigen/init.zsh` (July) kept loading the removed oh-my-git `oppa-lana-style` prompt → `antigen reset` + `cleanup` (work laptop; home laptop still to do), note in CLAUDE.md
- [x] 2026-10-17 `.zshrc`: Magento Cloud snippet deleted (also removed its hard-coded `/Users/ronan` fallback)
- [x] 2026-10-17 Vagrant dropped: `.zshrc` plugin, `.bashrc` oh-my-git source, `functions.sh` comment
- [x] 2026-10-17 `.gitconfig`: `http.cookiefile = /Users/ronan/.gitcookies` → `~/.gitcookies` (breaks on the other laptop)
- [x] 2026-10-17 `.gitconfig`: `[include] path = ~/.gitconfig.local` is at the top, so the tracked `[user]` below overrides it → move `[include]` to the end so each laptop's `.local` wins (e.g. work email)
- [x] 2026-10-17 `.bash_aliases`: `phpconsole` hard-coded `/Users/ronan/Workspace/…` → alias removed (php-console + php gone)
- [x] 2026-10-17 `.vim/.vim`: stray tracked symlink (work-laptop path) removed
- [x] 2026-10-17 `install.sh`: one loop, `ln -sfn`; skips backup when `~/X` is already a symlink (re-runs used to overwrite `X-dist` with the symlink); `.vimrc` now backed up too
- [x] 2026-10-17 `.zshrc`: oh-my-zsh loaded once (dropped `antigen use oh-my-zsh`, `bundle git`, overridden oh-my-git themes); antigen now after omz, syntax-highlighting last — 0.17s → 0.14s
- [x] 2026-10-17 `.pathes` Golang: dropped bogus `GOPATH=/usr/local/go/bin`, PATH gets `$GOROOT/bin` (GOPATH defaults to `~/go`)
- [x] 2026-10-17 `.pathes` gcloud lines: single quotes → double quotes so `$HOME` expands
- [x] 2026-10-17 `.vimrc:390`: `substitute(getcwd(), '/home/ronan/', …)` → `expand('~') . '/'`
