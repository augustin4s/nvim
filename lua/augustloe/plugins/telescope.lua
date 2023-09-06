local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
        return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
        return
end

telescope.setup({
        defaults = {
                mappings = {
                        i = {
                                ["<C-k>"] = actions.move_selection_previous,
                                ["<C-j>"] = actions.move_selection_next,
                                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                        }
                }
        },
        pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
                find_files = {
                        hidden = true
                }
        },
        extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
        }
})

telescope.load_extension("fzf")
