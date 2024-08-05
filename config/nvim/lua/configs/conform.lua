local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        ["_"] = { "prettierd" }, -- all other filetypes
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
