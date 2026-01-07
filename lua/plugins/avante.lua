return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  enabled = false,
  opts = {
    provider = "routellm",

    providers = {
      ---@type AvanteProvider
      routellm = {
        endpoint = "https://routellm.abacus.ai/v1/chat/completions",
        model = "route-llm", -- This won't get prefixed since we control parse_curl_args
        api_key_name = "ROUTELLM_API_KEY",

        parse_curl_args = function(opts, code_opts)
          local api_key = os.getenv(opts.api_key_name)
          if not api_key then
            error("API key not found in environment variable: " .. opts.api_key_name)
          end

          return {
            url = opts.endpoint,
            headers = {
              ["Authorization"] = "Bearer " .. api_key,
              ["Content-Type"] = "application/json",
            },
            body = {
              model = "route-llm",
              messages = code_opts.messages or {
                {
                  role = "user",
                  content = code_opts.question,
                },
              },
              stream = true,
            },
          }
        end,

        parse_response = function(data_stream, event_state, opts)
          -- Handle SSE format: "data: {...}"
          if data_stream:match("^data: ") then
            local json_str = data_stream:sub(7) -- Remove "data: " prefix

            if json_str == "[DONE]" then
              opts.on_complete(nil)
              return
            end

            local ok, json_data = pcall(vim.json.decode, json_str)
            if not ok then
              return -- Skip malformed JSON
            end

            -- Extract content from OpenAI-style response
            if json_data.choices and json_data.choices[1] then
              local delta = json_data.choices[1].delta
              if delta and delta.content then
                opts.on_chunk(delta.content)
              end

              -- Check if stream is finished
              if json_data.choices[1].finish_reason then
                opts.on_complete(nil)
              end
            end
          end
        end,
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_suggestions_respect_ignore = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        align = "center", -- left, center, right for title
        rounded = true,
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("avante.api").ask()
      end,
      desc = "avante: ask",
      mode = { "n", "v" },
    },
    {
      "<leader>ar",
      function()
        require("avante.api").refresh()
      end,
      desc = "avante: refresh",
    },
    {
      "<leader>ae",
      function()
        require("avante.api").edit()
      end,
      desc = "avante: edit",
      mode = "v",
    },
  },
}
