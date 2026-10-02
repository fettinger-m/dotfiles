# Mac setup rules

## Dotfiles
- Configs live in `~/dotfiles` and are linked into `~` with GNU Stow. Edit the repo file, never a loose copy in `~`; new configs become a stow package. See its README.
- After installing or removing anything with Homebrew, run `brew bundle dump --force --file=~/dotfiles/Brewfile`.
- Never commit or push without asking.

## Installing
- Homebrew for apps and CLI tools. Remove with `brew uninstall`, then `brew autoremove`.
- Look at data before deleting it; move it to `~/.Trash` when it might hold my own edits.
- Keep the setup minimal.

## Python
- Science: conda (`base` is not auto-activated).
- Everything else: uv (`uv run`, `uv init`/`uv add`, `uv tool install`).
- Never pip-install into macOS or Homebrew Python. There is deliberately no bare `python` command; don't add one or put anything into `~/.local/bin` by hand.

## Style
- Gruvbox Dark, IBM Plex Mono.
