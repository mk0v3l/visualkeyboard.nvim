## Installation

[Lazy]
```lua
'mk0v3l/visualkeyboard.vim'
```
Usage :
```vim
vim.keymap.set("n", "<leader>k", "<cmd>lua require'visualkeyboard'.toggle()<CR>", { silent = false, desc = " Toggle Keyboard")
```
Availible functions :
```lua
require'visualkeyboard'.toggle()
require'visualkeyboard'.togglemaj()
require'visualkeyboard'.show()
require'visualkeyboard'.showmaj()
require'visualkeyboard'.hide()
require'visualkeyboard'.switch()

