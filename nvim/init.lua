--
-- To reload do :source $MYVIMRC
--

-- Change <leader> to space
vim.g.mapleader = ' '

--
-- Plugins loaded with lazy.nvim
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
  {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        require'alpha'.setup(require'alpha.themes.theta'.config)
    end
  },
  { 
    'morhetz/gruvbox',
    config = function()
      -- load the colorscheme here
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  {
    'neoclide/coc.nvim',
    branch = 'release'
  },
  -- solarized color scheme
  { 'altercation/vim-colors-solarized' },

  -- add git markers to gutter to indicate new lines, etc
  { 'airblade/vim-gitgutter' },

  -- Solve git conflicts
  { 'rhysd/conflict-marker.vim' },

  -- Change status line
  {
    'vim-airline/vim-airline-themes',
    dependencies = {
      'vim-airline/vim-airline',
    },
    config = function()
      -- Configuracion de tabs para airlie
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
      vim.g["airline_theme"] = 'wombat'
    end,
  },

  -- Ctrl-p
  { 'ctrlpvim/ctrlp.vim' },

  -- Asynchronous Lint Engine (ALE)
  -- { 'w0rp/ale' },

  -- Javascript syntax highlighting and indentation
  { 'pangloss/vim-javascript' },

  -- JS + JSX: https://github.com/MaxMEllon/vim-jsx-pretty
  { 'yuezk/vim-js' },
  { 'maxmellon/vim-jsx-pretty' },

  -- TSX (Typescript + React) support
  { 'leafgarland/typescript-vim' },
  { 'peitalin/vim-jsx-typescript' },

  -- Another nice colorscheme: https://github.com/morhetz/gruvbox/wiki/Configuration
  -- Plug 'morhetz/gruvbox'

  -- Markdown
  { 'plasticboy/vim-markdown' },

  -- indent lines
  { 'yggdroot/indentline' },

  -- For autocomplete
  -- Plug('neoclide/coc.nvim', {branch = 'release'})

  -- Tagalong: open/close HTML tags
  { 'AndrewRadev/tagalong.vim' },

  -- Autoclose HTML tags
  { 'alvan/vim-closetag' },

  -- Nerdtree
  { 'scrooloose/nerdtree' },

  -- Support for dustjs
  { 'jimmyhchan/dustjs.vim' },

  -- For on the fly grep
  { 'wsdjeg/FlyGrep.vim' },

  -- Prosession session management
  {
    'dhruvasagar/vim-prosession',
    dependencies = {
      'tpope/vim-obsession'
    }
  },

  -- JSON with Comment
  { 'kevinoid/vim-jsonc' },

  -- Show marks on margin
  { 'kshenoy/vim-signature' },

  -- Syntax highlight for Twig
  { 'qbbr/vim-twig' },

  -- Syntax highlight for Blade
  { 'jwalton512/vim-blade' },

  -- Syntax highlight renpy
  { 'chaimleib/vim-renpy' },

  -- Telscope
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },

  -- We recommend updating the parsers on update
  --{('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) },

  -- Harpoon
  { 'nvim-lua/plenary.nvim' }, -- don't forget to add this one if you don't have it yet!
  { 'ThePrimeagen/harpoon' },

  -- Kickasm syntax
  { 'gryf/kickass-syntax-vim' },

  -- GLSL syntax
  { 'tikhomirov/vim-glsl' },
}
require("lazy").setup(plugins, opts)


--
-- CONFIGURATION
--

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Configuration for Solarized
--set background=dark
--let g:solarized_termcolors=256
--colorscheme solarized
vim.g.gruvbox_contrast_dark='hard'

-- Show line numbers
vim.o.number = true

-- show current line
vim.o.cursorline = true

vim.o.hlsearch   = true
vim.o.ignorecase = true
vim.o.incsearch  = true

-- default tabs and spaces handling
vim.o.expandtab    = true
vim.o.tabstop      = 4
vim.o.softtabstop  = 4
vim.o.shiftwidth   = 4

-- CtrlP (new fuzzy finder)
vim.g.ctrlp_map = ',e'
vim.g.ctrlp_custom_ignore = 'node_modules\\|DS_Store\\|git' -- Ignore node_modules

-- buffer navigation
vim.keymap.set('n', '<leader>bb', ':buffers<CR>')
vim.keymap.set('n', 'bn', ':bnext<CR>')
vim.keymap.set('n', 'bp', ':bprevious<CR>')
vim.keymap.set('n', 'bd', ':bdelete<CR>')
vim.keymap.set('n', '<C-S-Right>', ':bnext<CR>')
vim.keymap.set('i', '<C-S-Right>', '<ESC>:bnext<CR>')
vim.keymap.set('n', '<C-S-Left>', ':bprevious<CR>')
vim.keymap.set('i', '<C-S-Left>', '<ESC>:bprevious<CR>')

-- tab navigation
-- vim.keymap.set('n', 'tn', ':tabn<CR>')
-- vim.keymap.set('n', 'tp', ':tabp<CR>')
-- vim.keymap.set('n', 'tm', ':tabm<CR>')
-- vim.keymap.set('n', 'tt', ':tabnew<CR>')

-- Make <ESC> return quickly
vim.o.timeoutlen = 200

-- tabs / indent exceptions
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript, javascriptreact, javascript.jsx, html, blade, twig",
  callback = function(args)
    vim.o.tabstop      = 2
    vim.o.softtabstop  = 2
    vim.o.shiftwidth   = 2
  end
})

-- disable autofold in markdown files
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_conceal = 0

-- indent line config
vim.g.indentLine_char_list = {'┊'}

-- Enable mouse wheel
vim.o.mouse = nv

-- Copy paste: you must have `xclip` installed
vim.api.nvim_set_option("clipboard", "unnamed")

-- Configura Linters
vim.g.ale_linters = {
    javascript = {'eslint'},
}
vim.g.ale_php_phpcs_standard = 'PHP'

-- Configure tagalong
vim.g.tagalong_additional_filetypes = {'html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact', 'javascript'}


-- Configure closetag
vim.g.closetag_filetypes = 'javascript,jsx,javascriptreact,html,xhtml,phtml'

-- Powerline configuration
vim.g.airline_powerline_fonts = 1

-- set filetypes as typescriptreact
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.tsx, *.jsx",
  callback = function(args)
    vim.o.filetype      = 'typescriptreact'
  end
})


-- NERDTreeToggle bingin
-- vim.keymap.set('n', '<F3>', ':NERDTreeToggle<CR>')

-- For retro-coding
-- For Kickass files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.asm",
  callback = function(args)
    vim.o.filetype      = 'asm'
  end
})

--
-- For GBASM files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.z80",
  callback = function(args)
    vim.o.filetype = 'rgbasm'
  end
})

-- Telescope
vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fj', '<cmd>Telescope jumplist<cr>')

-- COC autocomplete. Use <TAB> to autocomplete
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
-- vim.map.set('i', '<silent><expr>', '<CR> coc#pum#visible() ? coc#pum#confirm()\: "<C-g>u<CR><c-r>=coc#on_enter()<CR>"')
vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], { expr = true, silent = true })

-- Git conflict resolver
-- disable the default highlight group
vim.g.conflict_marker_highlight_group = ''

-- Include text after begin and end markers
vim.g.conflict_marker_begin = '^<<<<<<< .*$'
vim.g.conflict_marker_end   = '^>>>>>>> .*$'

--highlight ConflictMarkerBegin guibg=#2f7366
--highlight ConflictMarkerOurs guibg=#2e5049
--highlight ConflictMarkerTheirs guibg=#344f69
--highlight ConflictMarkerEnd guibg=#2f628e
--highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81




--[[

--
-- To reload do :source $MYVIMRC
--
if exists('g:GtkGuiLoaded')
  " some code here
  call rpcnotify(1, 'Gui', 'Font', 'Monoid Regular 10')
  let g:GuiInternalClipboard = 1 
endif

-- ----------------------------------------------------------------------------------
-- Installed plugins. To install/update use: PlugInstall
-- ----------------------------------------------------------------------------------
call plug#begin()

-- solarized color scheme
Plug 'altercation/vim-colors-solarized'

-- add git markers to gutter to indicate new lines, etc
Plug 'airblade/vim-gitgutter'

-- Solve git conflicts
Plug 'rhysd/conflict-marker.vim'

-- Change status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

-- Asynchronous Lint Engine (ALE)
Plug 'w0rp/ale'

-- Javascript syntax highlighting and indentation
Plug 'pangloss/vim-javascript'

-- JS + JSX: https://github.com/MaxMEllon/vim-jsx-pretty
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

-- TSX (Typescript + React) support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

-- Another nice colorscheme: https://github.com/morhetz/gruvbox/wiki/Configuration
Plug 'morhetz/gruvbox'

-- Markdown
Plug 'plasticboy/vim-markdown'

-- indent lines
Plug 'yggdroot/indentline'

-- For autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

-- Tagalong: open/close HTML tags
Plug 'AndrewRadev/tagalong.vim'

-- Autoclose HTML tags
Plug 'alvan/vim-closetag'

-- Nerdtree
Plug 'scrooloose/nerdtree'

-- Support for dustjs
Plug 'jimmyhchan/dustjs.vim'

-- For on the fly grep
Plug 'wsdjeg/FlyGrep.vim'

-- Prosession session management
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

-- JSON with Comment
Plug 'kevinoid/vim-jsonc'

-- Show marks on margin
Plug 'kshenoy/vim-signature'

-- Syntax highlight for Twig
Plug 'qbbr/vim-twig'

-- Syntax highlight for Blade
Plug 'jwalton512/vim-blade'

-- Syntax highlight renpy
Plug 'chaimleib/vim-renpy'

-- Telscope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

-- Nord colorscheme
Plug 'arcticicestudio/nord-vim'

-- Harpoon
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'

-- Kickasm syntax
Plug 'gryf/kickass-syntax-vim'

-- GLSL syntax
Plug 'tikhomirov/vim-glsl'

call plug#end()

-- ----------------------------------------------------------------------------------
-- Configurations
-- ----------------------------------------------------------------------------------

-- Change <leader> to space
let mapleader = " "
--set timeoutlen 500

-- Enable syntax highlighting
syntax enable

-- Configuration for Solarized
--set background=dark
--let g:solarized_termcolors=256
--colorscheme solarized
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

-- Show line numbers
set number

-- show current line
set cursorline

set hlsearch    " highlight all search results
set ignorecase  " do case insensitive search 
set incsearch   " show incremental search results as you type

-- CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'   " Ignore node_modules

-- buffer navigation
map <leader>bb :buffers<CR>
map bn :bnext<CR>
map bp :bprevious<CR>
map <C-S-Right> :bnext<CR>
imap <C-S-Right> <ESC>:bnext<CR>
map <C-S-Left> :bprevious<CR>
imap <C-S-Left> <ESC>:bprevious<CR>

-- tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew 
-- Tabs
-- default tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

-- Make <ESC> return quickly
set timeoutlen=200

-- tabs / indent exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType blade setlocal shiftwidth=2 tabstop=2
autocmd FileType twig setlocal shiftwidth=2 tabstop=2

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2

-- disable autofold in markdown files
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0

-- indent line config
let g:indentLine_char_list = ['┊']

-- Enable mouse wheel
set mouse=nv

-- Configura Linters
let g:ale_linters = { 'javascript': ['eslint'], 'javascript.jsx': ['eslint'], }
let g:ale_php_phpcs_standard = 'PHP'

-- Configure tagalong
let g:tagalong_additional_filetypes = ['html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact', 'javascript']

-- Configure closetag
let g:closetag_filetypes = 'javascript,jsx,javascriptreact,html,xhtml,phtml'

-- Powerline configuration
let g:airline_powerline_fonts=1

-- Configuracion de tabs para airlie
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='wombat'

-- set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

-- NERDTreeToggle bingin
map <F3> :NERDTreeToggle<CR>

-- For retro-coding
-- For Kickass files
autocmd BufRead *.asm set filetype=asm
--
-- For GBASM files
autocmd BufRead *.z80 set filetype=rgbasm

-- Telescope
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fj <cmd>Telescope jumplist<cr>

-- COC autocomplete. Use <TAB> to autocomplete
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

-- Git conflict resolver
-- disable the default highlight group
let g:conflict_marker_highlight_group = ''

-- Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81


]]--

-- vim: se ts=2 sw=2 ai expandtab:
