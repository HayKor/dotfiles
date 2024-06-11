require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--- Make a new runner
map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").runner {
        id = "runner",
        pos = "sp",
        cmd = function()
            local file = vim.fn.expand "%"

            local ft_cmds = {
                python = "python3 " .. file .. " && exit",
                cpp = "clear && g++ -o out "
                    .. file
                    .. " && ./out"
                    .. " && exit",
                lua = "lua5.4 " .. file .. " && exit",
            }
            return ft_cmds[vim.bo.ft]
        end,
    }
end, { desc = "Terminal Toggle Floating term" })

--- Toggle a Terminal
map({ "n", "t" }, "<A-t>", function()
    require("nvchad.term").toggle { pos = "sp", id = "term" }
end, { desc = "Terminal Toggle" })
