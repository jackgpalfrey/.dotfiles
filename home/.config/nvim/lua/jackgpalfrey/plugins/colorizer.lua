return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "<leader>tc", vim.cmd.ColorizerToggle, desc = "[T]oggle [C]olorizer" },
	},
	opts = {
		filetypes = { "*" },
		user_default_options = {
			RGB = true, -- #RGB hex codes like #f12
			RRGGBB = true, -- #RRGGBB hex codes like #aa2132
			names = false, -- "Name" codes like Blue or blue
			RRGGBBAA = true, -- #RRGGBBAA hex codes #21aa4488
			AARRGGBB = true, -- 0xAARRGGBB hex codes 0x8821aa88
			rgb_fn = true, -- CSS rgb() and rgba() functions  rgb(100,10,12)
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Available modes for `mode`: foreground, background,  virtualtext
			mode = "background", -- Set the display mode.
			-- Available methods are false / true / "normal" / "lsp" / "both"
			-- True is same as normal
			tailwind = true, -- Enable tailwind colors
			-- parsers can contain values used in |user_default_options|
			sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
			virtualtext = "■",
			-- update color values even if buffer is not focused
			-- example use: cmp_menu, cmp_docs
			always_update = false,
		},
	},
}
