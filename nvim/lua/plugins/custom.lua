return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("alpha").setup(require("alpha.themes.theta").config)
    end,
  },

  -- Gruvbox color scheme
  {
    "morhetz/gruvbox",
    config = function()
      -- load the colorscheme here
      -- vim.cmd.colorscheme('gruvbox')
      -- Configuration for Solarized
      --set background=dark
      --let g:solarized_termcolors=256
      --colorscheme solarized
      vim.g.gruvbox_contrast_dark = "hard"
    end,
  },

  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      -- COC autocomplete. Use <TAB> to autocomplete
      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      -- vim.map.set('i', '<silent><expr>', '<CR> coc#pum#visible() ? coc#pum#confirm()\: "<C-g>u<CR><c-r>=coc#on_enter()<CR>"')
      vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], { expr = true, silent = true })
    end,
  },

  -- solarized color scheme
  { "altercation/vim-colors-solarized" },

  -- catppuccin color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        integrations = {
          treesitter = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- add git markers to gutter to indicate new lines, etc
  { "airblade/vim-gitgutter" },

  -- Solve git conflicts
  { "rhysd/conflict-marker.vim" },

  -- Ctrl-p
  -- { "ctrlpvim/ctrlp.vim" },

  -- Asynchronous Lint Engine (ALE)
  -- { 'w0rp/ale' },

  -- Javascript syntax highlighting and indentation
  { "pangloss/vim-javascript" },

  -- JS + JSX: https://github.com/MaxMEllon/vim-jsx-pretty
  { "yuezk/vim-js" },
  { "maxmellon/vim-jsx-pretty" },

  -- TSX (Typescript + React) support
  { "leafgarland/typescript-vim" },
  { "peitalin/vim-jsx-typescript" },

  -- Markdown
  { "plasticboy/vim-markdown" },

  -- indent lines
  { "yggdroot/indentline" },

  -- Tagalong: open/close HTML tags
  { "AndrewRadev/tagalong.vim" },

  -- Autoclose HTML tags
  { "alvan/vim-closetag" },

  -- Nerdtree
  -- { "scrooloose/nerdtree" },

  -- NvimTree
  --{
  --  "nvim-tree/nvim-tree.lua",
  --  dependencies = {
  --    "nvim-tree/nvim-web-devicons",
  --  },
  --  config = function()
  --    require("nvim-tree").setup({
  --      sort = {
  --        sorter = "case_sensitive",
  --      },
  --      view = {
  --        width = 30,
  --      },
  --      renderer = {
  --        group_empty = true,
  --      },
  --      filters = {
  --        dotfiles = true,
  --      },
  --    })
  --  end,
  --},

  -- Support for dustjs
  { "jimmyhchan/dustjs.vim" },

  -- For on the fly grep
  -- { "wsdjeg/FlyGrep.vim" },

  -- Prosession session management
  {
    "dhruvasagar/vim-prosession",
    dependencies = {
      "tpope/vim-obsession",
    },
  },

  -- JSON with Comment
  { "kevinoid/vim-jsonc" },

  -- Show marks on margin
  { "kshenoy/vim-signature" },

  -- Syntax highlight for Twig
  { "qbbr/vim-twig" },

  -- Syntax highlight for Blade
  { "jwalton512/vim-blade" },

  -- Syntax highlight renpy
  { "chaimleib/vim-renpy" },

  -- Telscope
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },

  -- We recommend updating the parsers on update
  --{('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) },

  -- Harpoon
  { "nvim-lua/plenary.nvim" }, -- don't forget to add this one if you don't have it yet!
  { "ThePrimeagen/harpoon" },

  -- Kickasm syntax
  { "gryf/kickass-syntax-vim" },

  -- GLSL syntax
  { "tikhomirov/vim-glsl" },

  -- GOLang
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      --require("lspconfig").gopls.setup {}
    end,
  },

  {
    "ray-x/navigator.lua",
    config = function()
      require("navigator").setup({
        --mason = true
      })
    end,
  },

  -- Codeium
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },

  -- Copilot
  --{
  --   "github/copilot.vim",
  --   config = function()
  --     vim.g.copilot_no_tab_map = false
  --   end,
  -- },

  -- Noice
  --{
  --  "folke/noice.nvim",
  --  event = "VeryLazy",
  --  opts = {
  --    -- add any options here
  --  },
  --  dependencies = {
  --    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --    "MunifTanjim/nui.nvim",
  --    -- OPTIONAL:
  --    --   `nvim-notify` is only needed, if you want to use the notification view.
  --    --   If not available, we use `mini` as the fallback
  --    "rcarriga/nvim-notify",
  --  }
  --},

  -- Highlight TODO comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
