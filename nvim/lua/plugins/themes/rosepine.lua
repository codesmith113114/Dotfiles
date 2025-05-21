return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Configure rose-pine
    require('rose-pine').setup {
      --- @usage 'auto'|'main'|'moon'|'dawn'
      variant = 'main',
      --- @usage 'main'|'moon'|'dawn'
      dark_variant = 'main',
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = true,

      groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
      },

      highlight_groups = {
        CursorLine = { bg = require('rose-pine.palette').overlay, blend = 10 },
        DiffAdd = { bg = require('rose-pine.palette').pine, fg = require('rose-pine.palette').base },
        DiffChange = { bg = require('rose-pine.palette').gold, fg = require('rose-pine.palette').base },
        DiffDelete = { bg = require('rose-pine.palette').love, fg = require('rose-pine.palette').base },
        DiffText = { bg = require('rose-pine.palette').rose, fg = require('rose-pine.palette').base },
      },
    }

    -- Load the colorscheme
    vim.cmd 'colorscheme rose-pine'

    -- Enable transparency on startup
    vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
    ]]

    local bg_transparent = true
    -- Toggle background transparency function
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      if bg_transparent then
        vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
        vim.cmd 'hi NormalNC guibg=NONE ctermbg=NONE'
        vim.cmd 'hi SignColumn guibg=NONE ctermbg=NONE'
      else
        vim.cmd 'colorscheme rose-pine'
        -- Optional: re-apply other highlights here if needed
      end
    end
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
