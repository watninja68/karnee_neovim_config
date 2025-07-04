return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = 'openai',
    --[[    provider = 'openrouter',]]
    --[[    provider = 'gemini', -- Recommend using Claude]]
    --[[-- auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot]]
    --[[behaviour = {]]
    --[[auto_suggestions = false, -- Experimental stage]]
    --[[auto_set_highlight_group = true,]]
    --[[auto_set_keymaps = true,]]
    --[[auto_apply_diff_after_generation = false,]]
    --[[support_paste_from_clipboard = false,]]
    --[[},]]

    -- MIGRATED CONFIGURATION
    providers = {
      --[[openrouter = {]]
      --[[  __inherited_from = 'openai',]]
      --[[  endpoint = 'https://openrouter.ai/api/v1',]]
      --[[  api_key_name = 'OPENROUTER_API_KEY',]]
      --[[  model = 'deepseek/deepseek-r1',]]
      --[[},]]
      --[[gemini = {]]
      --[[  -- @see https://ai.google.dev/gemini-api/docs/models/gemini]]
      --[[  model = 'gemini-2.0-flash',]]
      --[[  -- model = "gemini-1.5-flash",]]
      --[[  extra_request_body = {]]
      --[[    temperature = 0,]]
      --[[    max_tokens = 4096,]]
      --[[  },]]
      --[[},]]
      openai = {
        endpoint = 'https://api.openai.com/v1',
        model = 'gpt-4o-mini',
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_completion_tokens = 8192,
          --reasoning_effort = 'medium', -- low|medium|high, only used for reasoning models
        },
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
