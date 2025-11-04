# Earthsong for Neovim
A warm, earthy color theme for Neovim with vibrant accents and blanced tones.

## Overview

Earthsong is a color theme for Neovim featuring a warm, earthy palette with vibrant accents. The theme includes two variants:

- **Earthsong** - The default warm theme with vibrant, saturated colors
- **Earthsong Mute** - A more muted, understated variant with softer tones

## Getting Started

Install `earthsong` using your favorite package manager:

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- lua/plugins/earthsong.lua
return {
    "guillermodotn/neovim-earthsong",
    name = "earthsong",
    config = function()
        vim.cmd("colorscheme earthsong")
    end
}
```

### [pam.nvim](https://github.com/mvllow/pam.nvim)

```lua
{ source = "guillermodotn/neovim-earthsong", as = "earthsong" }
```

## Usage

### Basic Setup

```lua
-- Simple usage
require("earthsong").setup()
vim.cmd("colorscheme earthsong")
```

### Configuration Options

```lua
require("earthsong").setup({
    variant = "auto", -- auto, main, or mute
    dark_variant = "main", -- main or mute (default variant)
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "moss",
        panel = "surface",

        error = "terracotta",
        hint = "moss",
        info = "sage",
        warn = "amber",
        todo = "clay",
    },

    highlight_groups = {
        -- Custom overrides
        -- Comment = { fg = "sage", italic = true },
    },

    before_highlight = function(group, highlight, palette)
        -- Modify highlights before applying
    end,
})

vim.cmd("colorscheme earthsong")
-- Or use specific variant:
-- vim.cmd("colorscheme earthsong-main")
-- vim.cmd("colorscheme earthsong-mute")
```

## Color Palette
### Earthsong (Main) - Default
- **Base**: ![#292520](https://placehold.co/15x15/292520/292520.png) `#292520` - Warm charcoal background
- **Surface**: ![#322d27](https://placehold.co/15x15/322d27/322d27.png) `#322d27` - Slightly lighter surface
- **Overlay**: ![#3c3731](https://placehold.co/15x15/3c3731/3c3731.png) `#3c3731` - UI overlay color
- **Text**: ![#e5c7a9](https://placehold.co/15x15/e5c7a9/e5c7a9.png) `#e5c7a9` - Warm light text
- **Terracotta**: ![#ff645a](https://placehold.co/15x15/ff645a/ff645a.png) `#ff645a` - Solid red for errors
- **Amber**: ![#f5ae2e](https://placehold.co/15x15/f5ae2e/f5ae2e.png) `#f5ae2e` - Warm golden yellow
- **Clay**: ![#d0633d](https://placehold.co/15x15/d0633d/d0633d.png) `#d0633d` - Warm orangy brown
- **Oak**: ![#509552](https://placehold.co/15x15/509552/509552.png) `#509552` - Muted green
- **Sage**: ![#1398b9](https://placehold.co/15x15/1398b9/1398b9.png) `#1398b9` - Cool cyan/blue
- **Moss**: ![#85c54c](https://placehold.co/15x15/85c54c/85c54c.png) `#85c54c` - Deep green
- **Leaf**: ![#98e036](https://placehold.co/15x15/98e036/98e036.png) `#98e036` - Bright lime green

### Earthsong Mute
A more understated variant with softer, less saturated tones for reduced eye strain during extended use:
- Softer background and text colors
- Reduced color saturation
- Ideal for long coding sessions

## Supported Plugins

- telescope.nvim
- nvim-tree.lua
- gitsigns.nvim
- nvim-cmp
- indent-blankline.nvim
- bufferline.nvim
- which-key.nvim
- lualine.nvim
- And many more!

## Customization

### Override Specific Colors

```lua
require("earthsong").setup({
    groups = {
        error = "terracotta",
        warn = "amber",
    },
})
```

### Disable Italics

```lua
require("earthsong").setup({
    styles = {
        italic = false,
    },
})
```

### Custom Highlight Groups

```lua
require("earthsong").setup({
    highlight_groups = {
        Comment = { fg = "subtle", italic = true },
        String = { fg = "amber", italic = false },
    },
})
```

### Modify Highlights Before Apply

```lua
require("earthsong").setup({
    before_highlight = function(group, highlight, palette)
        -- Disable undercurls
        if highlight.undercurl then
            highlight.undercurl = false
        end
    end,
})
```
