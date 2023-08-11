return {
    "lukoshkin/highlight-whitespace",
    config = true,
    event = "VeryLazy",
    opts = {
        tws = '\\s\\+$',
        clear_on_winleave = false,
        user_palette = {
            markdown = {
                tws = 'RosyBrown',
                ['\\(\\S\\)\\@<=\\s\\(\\.\\|,\\)\\@='] = 'CadetBlue3',
                ['\\(\\S\\)\\@<= \\{2,\\}\\(\\S\\)\\@='] = 'SkyBlue1',
                ['\\t\\+'] = 'plum4',
            },
            other = {
                tws = 'PaleVioletRed',
                ['\\(\\S\\)\\@<=\\s\\(,\\)\\@='] = 'coral1',
                ['\\t\\+'] = 'plum4',
            }
        }
    }
}

