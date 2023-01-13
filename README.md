# nvim
Personal neovim configuration - work in progress

# Keybindings

## General
- `<leader>` = space key
- `<leader>nh` = clear search

## Window management
- `<leader>sv` = split window vertically
- `<leader>sh` = split window horizontally
- `<leader>se` = make split window equal size
- `<leader>sx` = close current split window
- `<leader>to` = open new tab
- `<leader>tx` = close current tab
- `<leader>tn` = go to next tab
- `<leader>tp` = go to previous tab
- `<leader>sm` = toggle split window maximization
- `<leader>e` = toggle file explorer
- `<leader>to` = go to next tab

## Telescope
- `<leader>ff` = find files within current working directory, respects .gitignore
- `<leader>fs` = find string in current working directory as you type
- `<leader>fc` = find string under cursor in current working directory
- `<leader>fb` = list open buffers in current neovim instance
- `<leader>fh` = list available help tags

## LSP
- `K` = display hover information about symbol under cursos in a floating window. See vim.lsp.buf.hover().
- `gd` = Jumps to the definition of the symbol under the cursor. See vim.lsp.buf.definition().
- `gD` = Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See vim.lsp.buf.declaration().
- `gi` = Lists all the implementations for the symbol under the cursor in the quickfix window. See vim.lsp.buf.implementation().
- `go` = Jumps to the definition of the type of the symbol under the cursor. See vim.lsp.buf.type_definition().
- `gr` = Lists all the references to the symbol under the cursor in the quickfix window. See vim.lsp.buf.references().
- `gl` = Show diagnostic in a floating window. See vim.diagnostic.open_float().
- `[d` = Move to the previous diagnostic in the current buffer. See vim.diagnostic.goto_prev().
- `]d` = Move to the next diagnostic. See vim.diagnostic.goto_next().
- `<F2>` = Renames all references to the symbol under the cursor. See vim.lsp.buf.rename().
- `<F4>` = Selects a code action available at the current cursor position. See vim.lsp.buf.code_action().
- `<Ctrl-k>` = Displays signature information about the symbol under the cursor in a floating window. See vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.

# Commands
- `:LspZeroFormat`:
    Formats the current buffer or range. If the "bang" is provided
    formatting will be synchronous (ex: LspZeroFormat!). See
    vim.lsp.buf.formatting(), vim.lsp.buf.range_formatting()
    and vim.lsp.buf.formatting_sync().



