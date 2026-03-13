# Neovim Config

Personal Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- Neovim >= 0.10
- `git`
- `ripgrep` — required for Telescope live grep (`<leader>ps`)
- `xclip` — required for system clipboard sync
- `clangd` — C/C++ language server
- `lua-language-server` — Lua LSP
- `rust-analyzer` — Rust LSP (via rustaceanvim)
- `clang-format` — C/C++ formatter
- `rustfmt` — Rust formatter

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
└── lua/
    ├── config/
    │   ├── lazy.lua          # Plugin manager bootstrap, leader key
    │   ├── set.lua           # Editor options
    │   └── remaps.lua        # Keymaps
    └── plugins/              # One file per plugin or group
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme (storm, transparent) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Dashboard on startup |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and indent |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Shows current function/class context at top |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, git |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer sidebar |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Fast file bookmarking and switching (v2) |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration (clangd, lua_ls) |
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | Rust LSP with rust-analyzer + clippy |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Auto-format on save (clang-format, rustfmt) |
| [git-blame.nvim](https://github.com/f-person/git-blame.nvim) | Inline git blame |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Lazygit integration |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights TODO/FIXME/NOTE comments |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Collection of small utilities |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless pane navigation between Neovim and tmux |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | Animated cursor movement |
| [tiny-glimmer.nvim](https://github.com/rachartier/tiny-glimmer.nvim) | Visual feedback on yank/paste |
| [showkeys](https://github.com/nvzone/showkeys) | Shows pressed keys on screen |
| [cellular-automaton.nvim](https://github.com/Eandrju/cellular-automaton.nvim) | Fun animation (`make it rain`) |
| [duck.nvim](https://github.com/tamton-aquib/duck.nvim) | Duck walking across the screen |

## Keymaps

**Leader key: `<Space>`**

### Navigation

| Keymap | Action |
|--------|--------|
| `<leader>pv` | Open netrw (file explorer) |
| `<C-n>` | Toggle Neo-tree sidebar |
| `<C-h/j/k/l>` | Navigate between windows / tmux panes |
| `<C-u>` | Move 15 lines up |
| `<C-i>` | Move 15 lines down |
| `<Up/Down/Left/Right>` | Resize current window |

### Telescope

| Keymap | Action |
|--------|--------|
| `<leader>pf` | Find files |
| `<C-p>` | Find git files |
| `<leader>ps` | Live grep (requires ripgrep) |
| `<leader>td` | Search TODO/FIXME comments |

### Harpoon

| Keymap | Action |
|--------|--------|
| `<leader>a` | Add file to harpoon list |
| `<C-e>` | Toggle harpoon quick menu |
| `<leader>1-6` | Jump to harpoon slot 1–6 |
| `<C-a>` | Previous harpoon file |
| `<C-d>` | Next harpoon file |

### LSP

| Keymap | Action |
|--------|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `<leader>ca` | Code action |

### Editing

| Keymap | Action |
|--------|--------|
| `<C-s>` | Save |
| `<leader>sn` | Save without formatting |
| `<leader>rw` | Replace word under cursor (with confirmation) |
| `<leader>ya` | Yank entire file |
| `<C-z>` | Horizontal split |
| `<C-x>` | Vertical split |
| `<C-y>` | Close window |

### Completion (nvim-cmp)

| Keymap | Action |
|--------|--------|
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<C-q>` | Abort completion |
| `<C-b/f>` | Scroll docs up/down |

## Auto-formatting

Files are automatically formatted on save using conform.nvim:

- `*.c`, `*.cpp`, `*.h`, `*.hpp`, `*.overlay` → `clang-format`
- `*.rs` → `rustfmt`

## Notes

- `lazy-lock.json` is gitignored intentionally — plugin versions are not pinned across machines.
- Clipboard requires `xclip` on Linux.
- Telescope grep requires `ripgrep` installed system-wide.
