require("asciitree").setup({
	-- Characters used to represent the tree.
	symbols = {
		child = "+",
		last = "+",
		parent = "|",
		dash = "-",
		blank = " ",
	},

	-- How deep each level should be drawn. This value can be overridden by
	-- calling the AsciiTree command with a number, such as :AsciiTree 4.
	depth = 2,

	-- The delimiter to look for when converting to a tree. By default, this
	-- looks for a tree that looks like:
	-- # Level 1
	-- ## Level 2
	-- ### Level 3
	-- #### Level 4
	--
	-- Changing it to "+" would look for the following:
	-- + Level 1
	-- ++ Level 2
	-- +++ Level 3
	-- ++++ Level 4
	delimiter = "#",
})
