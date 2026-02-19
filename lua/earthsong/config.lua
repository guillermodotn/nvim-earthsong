---@alias Variant "main" | "mute"
---@alias Palette { _nc: string, base: string, surface: string, overlay: string, muted: string, subtle: string, text: string, terracotta: string, amber: string, clay: string, oak: string, sage: string, moss: string, leaf: string, highlight_low: string, highlight_med: string, highlight_high: string, none: string }
---@alias PaletteColor "base" | "surface" | "overlay" | "muted" | "subtle" | "text" | "terracotta" | "amber" | "clay" | "oak" | "sage" | "moss" | "highlight_low" | "highlight_med" | "highlight_high"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local config = {}

---@class Options
config.options = {
	---Set the desired variant: "auto" will follow vim mode or defaults to main
	---@type "auto" | Variant
	variant = "auto",

	---Set the desired dark variant when `options.variant` is set to "auto".
	---@type Variant
	dark_variant = "main",

	---Differentiate between active and inactive windows and panels.
	dim_inactive_windows = false,

	---Extend background behind borders. Appearance differs based on which
	---border characters you are using.
	extend_background_behind_borders = true,

	enable = {
		legacy_highlights = true,
		migrations = true,
		terminal = true,
	},

	styles = {
		bold = true,
		italic = true,
		transparency = false,
	},

	---@type table<string, table<string, string>>
	palette = {},

	---@type table<string, string | PaletteColor>
	groups = {
		border = "muted",
		link = "moss",
		panel = "surface",

		error = "terracotta",
		hint = "moss",
		info = "sage",
		ok = "leaf",
		warn = "amber",
		note = "oak",
		todo = "clay",

		git_add = "sage",
		git_change = "clay",
		git_delete = "terracotta",
		git_dirty = "clay",
		git_ignore = "muted",
		git_merge = "moss",
		git_rename = "oak",
		git_stage = "moss",
		git_text = "clay",
		git_untracked = "subtle",

		---@type string | PaletteColor
		h1 = "moss",
		h2 = "sage",
		h3 = "clay",
		h4 = "amber",
		h5 = "oak",
		h6 = "leaf",

	},

	---@type table<string, Highlight>
	highlight_groups = {},

	---Called before each highlight group, before setting the highlight.
	---@param group string
	---@param highlight Highlight
	---@param palette Palette
	---@diagnostic disable-next-line: unused-local
	before_highlight = function(group, highlight, palette) end,
}

local function migrate(options)
	if options.bold_vert_split then
		local border = options.groups.border or "muted"
		options.highlight_groups["VertSplit"] = { fg = border, bg = border }
		options.highlight_groups["WinSeparator"] = { fg = border, bg = border }
	end

	if options.disable_background then
		options.highlight_groups["Normal"] = { bg = "NONE" }
	end

	if options.disable_float_background then
		options.highlight_groups["NormalFloat"] = { bg = "NONE" }
	end

	options.dim_inactive_windows = options.dim_nc_background or options.dim_inactive_windows

	if options.groups.background ~= nil then
		options.highlight_groups["Normal"] = { bg = options.groups.background }
	end

	if options.groups.comment ~= nil then
		options.highlight_groups["Comment"] = { fg = options.groups.comment }
	end

	if options.groups.punctuation ~= nil then
		options.highlight_groups["@punctuation"] = { fg = options.groups.punctuation }
	end

	options.styles.transparency = (options.disable_background and options.disable_float_background)
		or options.styles.transparency

	options.styles.bold = not (options.disable_bold or options.disable_bolds) and options.styles.bold or false

	options.styles.italic = not (options.disable_italic or options.disable_italics) and options.styles.italic or false

	-- Set h1 through h6 to the same color if only one is specified
	if type(options.groups.headings) == "string" then
		options.groups.h1 = options.groups.headings
		options.groups.h2 = options.groups.headings
		options.groups.h3 = options.groups.headings
		options.groups.h4 = options.groups.headings
		options.groups.h5 = options.groups.headings
		options.groups.h6 = options.groups.headings
	elseif type(options.groups.headings) == "table" then
		options.groups.h1 = options.groups.headings.h1 or options.groups.h1
		options.groups.h2 = options.groups.headings.h2 or options.groups.h2
		options.groups.h3 = options.groups.headings.h3 or options.groups.h3
		options.groups.h4 = options.groups.headings.h4 or options.groups.h4
		options.groups.h5 = options.groups.headings.h5 or options.groups.h5
		options.groups.h6 = options.groups.headings.h6 or options.groups.h6
	end
	options.groups.headings = nil

	return options
end

---@param options Options | nil
function config.extend_options(options)
	config.options = vim.tbl_deep_extend("force", config.options, options or {})

	if config.options.enable.migrations then
		config.options = migrate(config.options)
	end
end

return config
