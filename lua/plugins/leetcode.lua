return {
    "kawre/leetcode.nvim",
    lazy = false;
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",
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
