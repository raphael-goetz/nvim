return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"json",
				"toml",
				"yaml",
				"markdown",
				"tsx",
				"html",
				"proto",
				--
				"typst",
				"javascript",
				"typescript",
				"python",
				-- JVM
				"java",
				"kotlin",
				"lua",
				-- Golang
				"go",
				"gomod",
				"gosum",
				--
				"c_sharp",
				"rust"
			},
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
