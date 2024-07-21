-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'sidlatau/neotest-dart',
    },

    config = function()
      neotest = require 'neotest'
      neotest.setup {
        adapters = {
          require 'neotest-dart' {
            command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
            -- Change it to `fvm flutter` if using FVM
            -- change it to `dart` for Dart only tests
            use_lsp = true, -- When set Flutter outline information is used when constructing test name.
            -- Useful when using custom test names with @isTest annotation
            custom_test_method_names = {},
          },
        },
        vim.keymap.set('n', '<leader>tt', function()
          print 'Run the nearest test'
          neotest.run.run()
        end, { desc = 'Run the nearest test' }),

        vim.keymap.set('n', '<leader>ts', function()
          print 'Toggle Neotest summary'
          neotest.summary.toggle()
        end, { desc = 'Toggle Neotest summary' }),
      }
    end,
  },
}
