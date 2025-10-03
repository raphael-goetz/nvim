return {
	"catppuccin/nvim",
	name = "catppuccin",
	prority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-frappe")
	end
}
