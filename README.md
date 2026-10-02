# dotfiles

My macOS setup. Configs are linked into `~` with [GNU Stow](https://www.gnu.org/software/stow/): each top-level folder is a package whose contents mirror the home directory.

| Package | Links |
|---|---|
| `zsh` | `~/.zshrc`, `~/.zprofile` |
| `aliases` | `~/.aliases` |
| `functions` | `~/.functions` |
| `git` | `~/.gitconfig`, `~/.config/git/ignore` |
| `ghostty` | `~/.config/ghostty/config` |
| `zed` | `~/.config/zed/settings.json`, `tasks.json` |
| `claude` | `~/.claude/CLAUDE.md` (rules for Claude Code), `~/.claude/skills/lecture-notes/SKILL.md` (skill) |

## Setup on a new Mac

```sh
# 1. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Clone
git clone git@github.com:fettinger-m/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 3. Apps, CLI tools, fonts, VS Code extensions
brew bundle

# 4. Link configs (move any existing ~/.zshrc etc. out of the way first)
stow zsh aliases functions git ghostty zed latexindent
# claude without folding: ~/.claude and its subfolders stay real folders (Claude
# writes its state there), only the files are links
stow --no-folding claude

# 5. VS Code settings (not stowed: the target is a single file deep in ~/Library)
ln -sf ~/dotfiles/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"

# 6. macOS defaults (Dock, Finder)
./macos-defaults.sh
```

## Day to day

- Edit configs in this repo; the links in `~` pick up changes immediately.
- After installing or removing apps: `brew bundle dump --force` to update the `Brewfile`.
- Remove things not in the `Brewfile`: `brew bundle cleanup` (dry run), then `brew bundle cleanup --force`.

## Python

- Science: conda (Miniconda), `conda activate <env>`.
- Everything else: [uv](https://docs.astral.sh/uv/) — `uv run script.py`, `uv init`, `uv tool install`.
