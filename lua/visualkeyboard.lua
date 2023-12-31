-- local api, fn = vim.api, vim.fn

local M = {}

local Popup = require("nui.popup")
-- local event = require("nui.utils.autocmd").event

local popup = Popup({
	enter = false,
	focusable = true,
	border = {
		style = "none",
	},
	position = {
		row = 0,
		col = 80,
	},
	size = {
		width = "55",
		height = "9",
	},
})
local oldkey = {
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐",
	"│ ~ │ ! │ @ │ # │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │",
	"└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┐",
	"  │ A │ Z │ E │ R │ T │ Y │ U │ I │ O │ P │ { │ } │ | │",
	"┌─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴───┴───┤",
	'│ Q │ S │ D │_F_│ G │ H │_J_│ K │ L │ M │ " │ <Enter> │',
	"└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─────────┤",
	"  │ W │ X │ C │ V │ B │ N │ : │ < │ > │ ? │  <Shift>  │",
	"  └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───────────┘",
}
local keyboard = {
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐",
	"│ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │",
	"└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬───┐",
	"  │ a │ z │ e │ r │ t │ y │ u │ i │ o │ p │ [ │ ] │ \\ │",
	"  └┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴───┤",
	"   │ q │ s │ d │_f_│ g │ h │_j_│ k │ l │ m │ ' │ Enter│",
	"   └─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤",
	"     │ w │ x │ c │ v │ b │ n │ ; │ , │ . │ / │  Shift │",
	"     └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘",
}

local keyboardmaj = {
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐",
	"│ ! │ @ │ # │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │",
	"└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬───┐",
	"  │ A │ Z │ E │ R │ T │ Y │ U │ I │ O │ P │ { │ } │ | │",
	"  └┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴───┤",
	'   │ Q │ S │ D │_F_│ G │ H │_J_│ K │ L │ M │ " │ Enter│',
	"   └─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤",
	"     │ W │ X │ C │ V │ B │ N │ : │ < │ > │ ? │  Shift │",
	"     └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘",
}
local majflag = true
local showflag = false

vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, keyboardmaj)
function M.show()
	-- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, keyboard)
	popup:mount()
	showflag = true
	majflag = true
end

function M.showmaj()
	vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, keyboardmaj)
	popup:mount()
	showflag = true
	majflag = true
end

function M.toggle()
	if showflag == false then
		popup:mount()
		popup:show()
		showflag = true
	else
		popup:hide()
		showflag = false
	end
end

function M.togglemaj()
	if majflag == false then
		vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, keyboardmaj)
		majflag = true
	else
		vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, keyboard)
		majflag = false
	end
end

function M.switch()
	if majflag == false then
		majflag = true
		vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, keyboardmaj)
	else
		majflag = false
		vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, keyboard)
	end
end

return M
