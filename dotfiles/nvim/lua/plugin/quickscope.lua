vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd("highlight QuickScopePrimary guifg=#afff5f gui=underline")
		vim.cmd("highlight QuickScopeSecondary guifg=#5fffff gui=underline")
	end,
})

