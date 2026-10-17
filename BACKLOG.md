# Backlog

Known quirks & maintenance tasks. Tick `[x]` and move to **Done** (with date) in the fixing commit.
Priority: **Now** = broken or risky · **Soon** = cleanup that pays off · **Someday** = nice to have.

## Now

Nothing urgent.

## Soon

Nothing left.

## Someday

- [ ] `.gitconfig`: optional low-risk defaults from core git devs (`fetch.prune`, `push.autoSetupRemote`, `rerere.enabled`, `diff.algorithm = histogram`, `branch.sort = -committerdate`)

## Done

<!-- - [x] 2026-10-17 short description -->
- [x] 2026-10-17 `.Brewfile` (symlinked by `install.sh`, `brew bundle --global`): brew/cask/uv/npm tools for both laptops, + untracked `~/.Brewfile.local`. The daily upgrade job writes drift (extras / missing) to `~/.cache/brew-autoupgrade/brewfile-drift`, printed by new shells until `~/.Brewfile` changes. README: install steps + VS Code Settings Sync. Tested on home laptop (other laptop still to do: `git pull`, `./install.sh`, `brew bundle --global`, put work-only tools in `~/.Brewfile.local`, turn on VS Code Settings Sync)
- [x] 2026-10-17 antigen dropped: `zsh-history-substring-search` + `zsh-syntax-highlighting` now come from Homebrew (updated by the daily `brew upgrade`), sourced from `$HOMEBREW_PREFIX/share` (guarded; ↑/↓ bindings only if the plugin loaded). `antigen.zsh`, the `_antigen_compinit` workaround and the dead `HISTSIZE`/`SAVEHIST`/`HISTFILE` lines deleted (omz sets 50000/10000/`~/.zsh_history`). 0.14s → 0.12s. Tested on home laptop (other laptop still to do: `brew install zsh-history-substring-search zsh-syntax-highlighting`, `rm -rf ~/.antigen`)
- [x] 2026-10-17 `.gitconfig`: `[credential]` blocks (GCM, `dev.azure.com`) removed — GCM binary absent on the home laptop and `helper =` was wiping `osxkeychain`, now back as the helper (other laptop still to do: re-add both blocks to `~/.gitconfig.local` if GCM is used there)
- [x] 2026-10-17 `.gitconfig`: `github:`/`gist:` now fetch over `https://` (`git://` is off at GitHub, `insteadOf` doesn't chain); push still goes over SSH. Dropped the `pushInsteadOf = git://…` lines and the commented-out `[url "https://"]` duplicate
- [x] 2026-10-17 `.gitconfig`: global `[branch "master"]` (origin/master merge config forced on every repo) dropped
- [x] 2026-10-17 `.local` example templates: dropped, not needed (README already shows a `~/.gitconfig.local` example; both `.local` includes are optional)
- [x] 2026-10-17 Vim `after/ftplugin`: `go.vim` (dead `$GOROOT/misc/vim`, Vim ships Go support) and `latex.vim` (okular, LaTeX-Suite not installed) deleted; `xml.vim` no longer pipes every XML file through `xmllint` on open, `:PrettyXML` kept. Tested on home laptop
- [x] 2026-10-17 Vim: `.vim/plugin/comments.vim` deleted (unused); its Ctrl-C/Ctrl-X comment maps were overriding the `.vimrc` clipboard copy/cut maps, which now work. Tested on home laptop
- [x] 2026-10-17 Vim: 18 git submodules (only 3 ever checked out) + pathogen → vim-plug with nerdtree + vim-airline (replaces the hand-made statusline). NERDTree no longer opens in git commit messages; its auto-close uses the current `b:NERDTree` API. Dropped all PHP/Symfony/Twig support, the snippetsEmu `*_snippets.vim` files and dead `.vimrc` config (SnipMate, Tlist, solarized, zencoding, powerline). `comments.vim` kept in `.vim/plugin/`. Tested on home laptop (other laptop still to do: `vim +PlugInstall +qa`)
- [x] 2026-10-17 `.gitconfig`: dropped SourceTree difftool/mergetool (app gone, never selected as `diff.tool`/`merge.tool`) and the `git media` filter (abandoned tool, superseded by LFS)
- [x] 2026-10-17 `install.sh`: an existing `X-dist` backup is never overwritten (files) or nested into (dirs); the new backup gets a `X-dist.<timestamp>` name instead
- [x] 2026-10-17 `.bash_aliases`: dropped `gitmyzsh`, `screencast`, `ssarl`/`ssars`/`ssms`, `sniff`, `chch`, `sfsetset`, `wtf`, `mongocheat` and the emptied "server" section
- [x] 2026-10-17 `.bashrc`: Android `/home/ronan` paths dropped; `PAGER=most`, `~/local/bin`, RVM guarded; fortune/cowsay → same guarded `fortune | ponysay` as `.zshrc`; duplicate `dataurl` dropped (comes from `functions.sh`)
- [x] 2026-10-17 `.zshrc.pre-oh-my-zsh` deleted (+ install.sh); `.bash_aliases`: apt-get, `ifif`, `alert` (notify-send), boot2docker, svn, node-webkit aliases dropped, duplicate `dl`/`gs` removed. Dangling `~/.zshrc.pre-oh-my-zsh` symlink removed on home laptop (other laptop still to do)
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
