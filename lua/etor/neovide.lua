vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = '#1a1b26' })
    end
})

local SCALE_STEP = 0.5;

local function change_scale(delta)
    local current_scale = vim.g.neovide_scale_factor or 1.0 -- Default scale is 1.0 if not set
    vim.g.neovide_scale_factor = current_scale + delta
end

vim.api.nvim_set_keymap('n', '<C-0>', '', {
    noremap = true,
    silent = true,
    callback = function()
        vim.g.neovide_scale_factor = 1.0
        vim.cmd('redraw!')
    end
})

vim.api.nvim_set_keymap('n', '<C-=>', '', {
    noremap = true,
    silent = true,
    callback = function()
        vim.g.neovide_scale_factor = (
            vim.g.neovide_scale_factor or 1.0
        ) + SCALE_STEP
        vim.cmd('redraw!')
    end
})

vim.api.nvim_set_keymap('n', '<C-_>', '', {
    noremap = true,
    silent = true,
    callback = function()
        print("hello")
    end
})


vim.o.guifont = "IosevkaEtor:h15.2:#e-subpixelantialias:#h-none"
vim.o.linespace = 4
vim.o.termguicolors = false

-- Cursor appearance and animation settings
-- vim.o.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait800-blinkoff800-blinkon800-Cursor/lCursor"
-- vim.g.neovide_cursor_animation_length = 0.03
-- vim.g.neovide_cursor_trail_size = 0.7
-- vim.g.neovide_cursor_antialiasing = true
-- vim.g.neovide_cursor_animate_in_insert_mode = true
-- vim.g.neovide_cursor_animate_command_line = true
-- vim.g.neovide_cursor_unfocused_outline_width = 0.1
-- vim.g.neovide_cursor_smooth_blink = true
-- vim.g.neovide_cursor_vfx_mode = "railgun"
-- vim.g.neovide_cursor_vfx_opeacity = 200.00
-- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
-- vim.g.neovide_cursor_vfx_particle_density = 7.0
-- vim.g.neovide_cursor_vfx_particle_speed = 10.0
-- for railgun only
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 0.4

vim.g.neovide_transparency = 0.93

vim.g.neovide_show_border = true

vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_scale_factor = 1.0 -- TODO: Implement keybindings for this

vim.g.neovide_window_blurred = true

vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 5.0
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_z_height = 50

vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5


vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_scroll_animation_far_lines = 9999

vim.g.neovide_confirm_quit = false
vim.g.neovide_fullscreen = false

vim.g.neovide_remember_window_size = true
vim.g.neovide_profiler = false -- shows a modal with performance information
