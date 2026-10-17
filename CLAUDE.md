# dotfiles — Claude context

Personal shell/vim/git config of Ronan Guilloux, maintained since 2014.
**Public repo** (github.com/ronanguilloux/dotfiles, WTFPL): every commit is world-readable.

## How it works

- `install.sh` backs up `~/.X` → `~/.X-dist`, then symlinks `~/dotfiles/.X` → `~/.X`.
  **Edits here are live** in every new shell, so a syntax error breaks the next terminal.
- Repo path `~/dotfiles` is hard-coded (install.sh, .zshrc `functions.sh`/`antigen.zsh` sources).
  That's fine: it's relative to `$HOME`.
- Primary target: **macOS, zsh**.

## Two machines, one repo

The same checkout runs on a **home laptop and a work laptop with different `$HOME` paths**.

- Never hard-code `/Users/<name>` or `/home/<name>`: use `$HOME` / `~` (shell), `~/` (gitconfig pathnames),
  `expand('~')` (vim). Check before committing: `git grep -nE '/Users/|/home/' -- . ':!antigen.zsh'`.
- Anything that exists on one machine only gets an `if [ -d … ]` / `[ -f … ]` guard (tools, apps, work dirs).
- Per-machine identity/settings (git `user.email`, work aliases, proxies) → `~/.gitconfig.local`,
  `~/.bash_aliases.local`, never the tracked files.
- Don't assume the Homebrew prefix (`/opt/homebrew` vs `/usr/local`); guard it or use `command -v`.
- A change tested on one laptop is only half-tested: say so when reporting.
- **Every report ends with "On the other laptop:"**: what to do there (`git pull`, `antigen reset`,
  create/edit a `.local` file, install a tool, re-run `install.sh`…), or "just `git pull`" if nothing else.
  Machine-local actions (cache resets, `.local` edits) also go in the BACKLOG Done entry as "(other laptop still to do)".
  `.bashrc`, apt/`notify-send`/`ifdown` aliases, `.zshrc.pre-oh-my-zsh` are Linux/Vagrant leftovers.
- **No longer used** (don't add or maintain support): Vagrant, Magento Cloud.

## Files

| File | Role |
| --- | --- |
| `.zshrc` | Main entry. Load order: oh-my-zsh vars → `.bash_aliases` → `~/.bash_aliases.local` → `.pathes` → `functions.sh` → oh-my-zsh → antigen (history-substring-search, syntax-highlighting) → ponysay → daily auto-upgrade → nvm |
| `.pathes` | All PATH tweaks, each wrapped in `if [ -d … ]` so absent tools are skipped. Later blocks prepend → win. |
| `.bash_aliases` | Aliases shared by bash and zsh (French comments). Many depend on `~/Bin` = [ronanguilloux/Bin](https://github.com/ronanguilloux/Bin). |
| `functions.sh` | Small shell functions (json, dataurl, phpserver…). |
| `.gitconfig` | Aliases, colors, `gh:`/`gist:` URL shorthands, `git://`→`https://` rewrite, LFS, GCM. Includes `~/.gitconfig.local`. |
| `.gitignore_global` | Global excludes (also ignores `**/.claude/settings.local.json`). |
| `.vimrc`, `.vim/` | Pathogen; plugins are git submodules in `.vim/bundle/`. |
| `antigen.zsh` | **Vendored, generated** — never edit; replace wholesale to upgrade. |

## Deliberate choices — keep them

- **Daily auto-upgrade block** in `.zshrc`: date stamp in `~/.cache/brew-autoupgrade/last-run` plus
  `/usr/bin/lockf -s -t 0` (macOS-only) so only one tab per day runs `brew upgrade` + `uv tool upgrade --all`,
  detached (`&!`), logged to `~/Library/Logs/brew-autoupgrade.log`. Must never block shell startup.
- Custom `git_prompt_info` override = fast prompt (skips git status).
- `if [ -d … ]` / `if [ -f … ]` guards everywhere: one config must load on machines with different tools.
- Machine-specific or secret stuff goes in **untracked** `~/.gitconfig.local` and `~/.bash_aliases.local`.

## Public-repo rules (important)

- Never commit tokens, passwords, hostnames, internal IPs, client names, or personal paths beyond `$HOME`.
  Put them in the `.local` files instead. Check `git diff --staged` for these before every commit.
- `[user]` in `.gitconfig` stays tracked on purpose (public in every commit anyway); `~/.gitconfig.local` overrides it.
- Git history still holds a work email and a DB password (aliases deleted 2026-10-17): both are dead
  (DB and mailbox gone), so no history rewrite needed. Rewriting history is the owner's call anyway.

## Editing conventions

- Match existing style: `if [ -d "…" ] ; then export PATH="…:$PATH"; fi` in `.pathes`.
- New PATH entries → `.pathes`, not `.zshrc`. New aliases → `.bash_aliases` (must stay bash-compatible).
- Keep shell startup fast: nothing synchronous that hits the network.
- Commits: conventional prefix (`fix:`, `feat:`, `chore:`), branch `master`.

## Verify after edits

```bash
zsh -n ~/dotfiles/.zshrc && for f in .bash_aliases functions.sh .pathes install.sh; do bash -n ~/dotfiles/$f || echo "FAIL $f"; done
time zsh -i -c exit          # startup must succeed and stay fast
git config -f ~/dotfiles/.gitconfig --list >/dev/null   # gitconfig parses
```

Changed an `antigen bundle`/`theme` line? Antigen keeps loading its cache `~/.antigen/init.zsh` and
doesn't notice the edit: run `antigen reset` (then `antigen cleanup`) on **each** laptop.

## Backlog

Known quirks and maintenance tasks are listed in [BACKLOG.md](BACKLOG.md). When you fix one,
tick it (`- [x]`) in the same commit. When you spot a new one, add it there instead of fixing it unasked.
