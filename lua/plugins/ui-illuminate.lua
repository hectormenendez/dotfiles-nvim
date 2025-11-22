-- highlights all other matches of word under the cursor
return {
    "RRethy/vim-illuminate",
    lazy = false,
    configure = function()
        require("illuminate").configure({
        })
    end
}
