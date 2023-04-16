return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup(nil, {
			RRGGBBAA = true,
		})
	end,
}
