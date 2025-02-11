-- NOTE: For grep to work it requires to have ripgrep installed on the pc!!!!
return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        "build/.*",     -- Ignore everything under build directory
                        "%.git/.*",     -- Ignore .git directories
                        "%.venv/.*",    -- Ignore .venv directories
                        "%.cache/.*",   -- Ignore .cache directories
                        "%.hex$"        -- Ignore .hex files
                    }
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        no_ignore = true,
                        follow = true,  -- Follow symbolic links
                        depth = 8,      -- Increase search depth to reach nested deps folders
                        file_ignore_patterns = {
                            "build/.*",     -- Ignore everything under build directory
                            "%.git/.*",     -- Ignore .git directories
                            "%.venv/.*",    -- Ignore .venv directories
                            "%.cache/.*",   -- Ignore .cache directories
                            "%.hex$"        -- Ignore .hex files
                        }
                    },
                    grep_string = {
                        additional_args = function()
                            return {
                                "--hidden",
                                "--no-ignore",
                                "--follow",   -- Follow symbolic links
                                "--max-depth=8",  -- Search deeper in directory structure
                                "--glob=!build/**",  -- Exclude build directory for ripgrep
                                "--glob=!.git/**",   -- Exclude .git directories for ripgrep
                                "--glob=!.venv/**",  -- Exclude .venv directories for ripgrep
                                "--glob=!.cache/**", -- Exclude .cache directories for ripgrep
                                "--glob=!*.hex"      -- Exclude .hex files for ripgrep
                            }
                        end,
                        no_ignore = true
                    },
                    live_grep = {
                        additional_args = function()
                            return {
                                "--hidden",
                                "--no-ignore",
                                "--follow",   -- Follow symbolic links
                                "--max-depth=8",  -- Search deeper in directory structure
                                "--glob=!build/**",  -- Exclude build directory for ripgrep
                                "--glob=!.git/**",   -- Exclude .git directories for ripgrep
                                "--glob=!.venv/**",  -- Exclude .venv directories for ripgrep
                                "--glob=!.cache/**", -- Exclude .cache directories for ripgrep
                                "--glob=!*.hex"      -- Exclude .hex files for ripgrep
                            }
                        end,
                        no_ignore = true
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").load_extension("ui-select")
        end
    },
}
-- NOTE: For grep to work it requires to have ripgrep installed on the pc!!!!
