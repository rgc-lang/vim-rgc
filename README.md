# Vim / Neovim support for RGC

A lightweight Vim plugin providing:

- Syntax highlighting for `.rg` files
- Filetype detection and sensible indent settings
- A `:make`-style compiler integration for `rgc`
- LSP client configuration examples for Neovim (built-in `vim.lsp`) and coc.nvim

## Installation

### Vim (native packages)

```sh
mkdir -p ~/.vim/pack/rgc/start
git clone https://github.com/rgc-lang/vim-rgc ~/.vim/pack/rgc/start/vim-rgc
```

### Neovim (lazy.nvim)

```lua
{
  "rgc-lang/vim-rgc",
  ft = "rgc",
  build = function()
    vim.filetype.add({ extension = { rg = "rgc" } })
  end,
}
```

## Usage

Open any `.rg` file — syntax highlighting is automatic.

```vim
:setfiletype rgc          " force filetype
:make                    " rgc % -o %<  (compile current file)
```

### Compiler integration

With `compiler/rgc.vim`:

```vim
:compiler rgc
:make
```

This runs `rgc <current-file> -o <current-file-basename>` and parses
`file:line:column: error:` output into the quickfix list.

## LSP

The RGC language server is the `rgc` binary itself, started with `lsp --stdio`
(e.g. `rgc lsp --stdio`).

### Neovim (built-in LSP)

```lua
require("vim.lsp.config.rgc").setup({
  cmd = { "rgc", "lsp", "--stdio" },
  filetypes = { "rgc" },
})
```

See [`lsp/neovim.lua`](lsp/neovim.lua) for the full example.

### coc.nvim

Add to `coc-settings.json`:

```json
{
  "languageserver": {
    "rgc": {
      "command": "rgc",
      "args": ["lsp", "--stdio"],
      "filetypes": ["rgc"]
    }
  }
}
```

## License

Apache-2.0. See [LICENSE](LICENSE).