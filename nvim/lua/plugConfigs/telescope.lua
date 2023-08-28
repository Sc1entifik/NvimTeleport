local builtin = require("telescope.builtin")

local function telescopeMap(leaderlessKeyMap, builtinModule)
	keymap = '<leader>' .. leaderlessKeyMap
	return vim.keymap.set('n', keymap, builtinModule, {})
end

telescopeMap('ff', builtin.find_files)
telescopeMap('gg', builtin.live_grep)
telescopeMap('bb', builtin.buffers)
telescopeMap('hh', builtin.help_tags)


