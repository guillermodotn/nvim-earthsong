local p = require("earthsong.palette")
local config = require("earthsong.config")

local bg_base = p.surface
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.clay, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.clay },
		c = { bg = bg_base, fg = p.text },
	},
	insert = {
		a = { bg = p.sage, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.sage },
		c = { bg = bg_base, fg = p.text },
	},
	visual = {
		a = { bg = p.moss, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.moss },
		c = { bg = bg_base, fg = p.text },
	},
	replace = {
		a = { bg = p.oak, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.oak },
		c = { bg = bg_base, fg = p.text },
	},
	command = {
		a = { bg = p.terracotta, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.terracotta },
		c = { bg = bg_base, fg = p.text },
	},
	inactive = {
		a = { bg = bg_base, fg = p.muted, gui = "bold" },
		b = { bg = bg_base, fg = p.muted },
		c = { bg = bg_base, fg = p.muted },
	},
}
