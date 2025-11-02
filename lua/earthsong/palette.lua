local options = require("earthsong.config").options
local variants = {
	main = {
		_nc = "#22201b",
		base = "#292520",
		surface = "#322d27",
		overlay = "#3c3731",
		muted = "#675f54",
		subtle = "#8b8278",
		text = "#e5c7a9",
		terracotta = "#ff645a",
		amber = "#f5ae2e",
		clay = "#d0633d",
		oak = "#509552",
		sage = "#1398b9",
		moss = "#85c54c",
		leaf = "#98e036",
		highlight_low = "#2f2b26",
		highlight_med = "#413b35",
		highlight_high = "#544e48",
		none = "NONE",
	},
	mute = {
		_nc = "#18170f",
		base = "#1a1a13",
		surface = "#23221a",
		overlay = "#2d2c22",
		muted = "#6b6b5f",
		subtle = "#8a8a7d",
		text = "#e8e8e2",
		terracotta = "#d9724b",
		amber = "#d4a574",
		clay = "#c68566",
		oak = "#5d8e6d",
		sage = "#7ab5a0",
		moss = "#8fa878",
		leaf = "#9cae8a",
		highlight_low = "#25241b",
		highlight_med = "#35342a",
		highlight_high = "#4a483d",
		none = "NONE",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return variants[options.dark_variant or "main"]
