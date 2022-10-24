-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to jk
map('i', 'jk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit
map('t', 'jk', '<C-\\><C-n>')
map('t', '<C-h>', '<Cmd>wincmd <C-h><CR>')
map('t', '<C-j>', '<Cmd>wincmd <C-j><CR>')
map('t', '<C-k>', '<Cmd>wincmd <C-k><CR>')
map('t', '<C-l>', '<Cmd>wincmd <C-l><CR>')

-- ToggleTerm
-- map('n', '<c-]>', ':ToggleTerm direction=horizontal<CR>')
map('n', '<c-\\>', ':ToggleTerm direction=vertical<CR>')

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- Telescope fuzzy finder
map('n', 'fF', ':Telescope<CR>')                    -- builtin
map('n', 'ff', ':Telescope find_files<CR>')         -- files
map('n', 'fh', ':Telescope help_tags<CR>')          -- help-files
map('n', 'ft', ':Telescope treesitter<CR>')         -- treesitter
map('n', 'fg', ':Telescope live_grep<CR>')         -- treesitter

-- Leap
require('leap').add_default_mappings()

-- Barbar Tab Manager
local opts = { noremap = true, silent = true }

-- Move to next/previous buffer
map('n', '<Space>l', '<Cmd>BufferNext<CR>', opts)
map('n', '<Space>h', '<Cmd>BufferPrevious<CR>', opts)
-- Re-order to next/previous
map('n', '<Space>k', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<Space>j', '<Cmd>BufferMovePrevious<CR>', opts)
-- Close current buffer
map('n', '<leader>q', '<Cmd>BufferClose<CR>', opts)
-- Pin current buffer
map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Enter picker mode
map('n', '<Space>p', '<Cmd>BufferPick<CR>', opts)
-- Goto buffer buffernumber
map('n', '<Space>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Space>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<Space>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<Space>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<Space>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<Space>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<Space>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<Space>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<Space>9', '<Cmd>BufferGoto 9<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
