local plugins = {
	-- use packer to manage packer
	{ "wbthomason/packer.nvim" },
	-- casing aware search and replace
	{ "lambdalisue/reword.vim" },
	-- utility mappings
	{ "tpope/vim-unimpaired" },
	-- highlight unique chars
	{ "jinh0/eyeliner.nvim" },
	-- jump in buffer
	{
		"phaazon/hop.nvim",
		config = function()
			local map = vim.keymap.set
			local hop = require("hop")
			local hint = require("hop.hint").HintDirection

			hop.setup({})

			map("n", "s", function()
				hop.hint_char2({
					direction = hint.AFTER_CURSOR
				})
			end)

			map("n", "S", function()
				hop.hint_char2({
					direction = hint.BEFORE_CURSOR
				})
			end)

			map("n", "<c-g>", function()
				hop.hint_lines_skip_whitespace()
			end)
		end
	},
	-- support . for more things
	{ "tpope/vim-repeat" },
	-- work on delims
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end
	},
	-- do not jump on star
	{
		"ironhouzi/starlite-nvim",
		config = function()
			local a = vim.api

			a.nvim_set_keymap("n", "*", ":lua require('starlite').star()<cr>", { silent = true })
			a.nvim_set_keymap("n", "g*", ":lua require('starlite').g_star()<cr>", { silent = true })
			a.nvim_set_keymap("n", "#", ":lua require('starlite').hash()<cr>", { silent = true })
			a.nvim_set_keymap("n", "g#", ":lua require('starlite').g_hash()<cr>", { silent = true })
		end,
	},
	-- space = operate on segment
	{ "chaoren/vim-wordmotion", setup = [[vim.g.wordmotion_prefix = '<space>']] },
	-- gs = sort
	{ "ralismark/opsort.vim" },
}

return function()
	vim.cmd [[packadd packer.nvim]]
	require("packer").startup(function(use)
		use(plugins)
	end)
end
