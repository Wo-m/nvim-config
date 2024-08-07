return {
    "kawre/leetcode.nvim",
    lazy = false;
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        lang = "cpp",
        injector = {
            ["cpp"] = {
            before = { "#include <bits/stdc++.h>", "using namespace std;" },
            after = "int main() {}",
        },
    },
    },
}
