return {
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      -- Create a complete replacement for the setup function to avoid vim.validate
      local M = require("wrapping")
      local original_setup = M.setup
      
      -- Replace the setup function to bypass the deprecation warning
      M.setup = function(o)
        -- We'll perform our own validation instead of using vim.validate
        local opts = vim.tbl_deep_extend("force", {}, o or {})
        
        -- Perform type checking manually
        local function verify_type(name, value, expected_type)
          local actual_type = type(value)
          if actual_type ~= expected_type then
            error(string.format("Expected %s to be %s, got %s", name, expected_type, actual_type))
          end
        end
        
        -- Check all the options that would be validated in original setup
        if opts.set_nvim_opt_defaults ~= nil then
          verify_type("set_nvim_opt_defaults", opts.set_nvim_opt_defaults, "boolean")
        end
        if opts.softener ~= nil then
          verify_type("softener", opts.softener, "table")
        end
        if opts.create_commands ~= nil then
          verify_type("create_commands", opts.create_commands, "boolean")
        end
        if opts.create_keymaps ~= nil then
          verify_type("create_keymaps", opts.create_commands, "boolean")
        end
        if opts.auto_set_mode_heuristically ~= nil then
          verify_type("auto_set_mode_heuristically", opts.auto_set_mode_heuristically, "boolean")
        end
        if opts.auto_set_mode_filetype_allowlist ~= nil then
          verify_type("auto_set_mode_filetype_allowlist", opts.auto_set_mode_filetype_allowlist, "table")
        end
        if opts.auto_set_mode_filetype_denylist ~= nil then
          verify_type("auto_set_mode_filetype_denylist", opts.auto_set_mode_filetype_denylist, "table")
        end
        if opts.buftype_allowlist ~= nil then
          verify_type("buftype_allowlist", opts.buftype_allowlist, "table")
        end
        if opts.notify_on_switch ~= nil then
          verify_type("notify_on_switch", opts.notify_on_switch, "boolean")
        end
        if opts.log_path ~= nil then
          verify_type("log_path", opts.log_path, "string")
        end
        
        -- Now call the original function, but use a workaround for vim.validate
        local _original_validate = vim.validate
        vim.validate = function() return true end -- Replace with a no-op function
        
        -- Call the original setup
        local result = original_setup(o)
        
        -- Restore the original validate function
        vim.validate = _original_validate
        
        return result
      end
      
      -- Now call setup with our patched function
      M.setup()
    end,
  },
}
