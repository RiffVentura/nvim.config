require('nvim-tree').setup({
    view = {
        number = true,
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = {
                width = 100,
                col = 10,
            },
        }
    }
})
