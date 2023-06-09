-- Resize
add('n', '<A-k>', '<C-w>4+')
add('n', '<A-j>', '<C-w>4-')
add('n', '<A-h>', '<C-w>6>')
add('n', '<A-l>', '<C-w>6<')

-- Split
add('n', '<C-A-v>', '<C-w>v')
add('n', '<C-A-s>', '<C-w>s')

-- Move among windows
add('n', '<C-h>', '<C-w>h')
add('n', '<C-j>', '<C-w>j')
add('n', '<C-k>', '<C-w>k')
add('n', '<C-l>', '<C-w>l')

-- Move among windows
add('t', '<C-h>', '<C-\\><C-n><C-w>h')
add('t', '<C-j>', '<C-\\><C-n><C-w>j')
add('t', '<C-k>', '<C-\\><C-n><C-w>k')
add('t', '<C-l>', '<C-\\><C-n><C-w>l')

-- Swap windows
add('n', '<C-S-h>', '<C-w>H')
add('n', '<C-S-j>', '<C-w>J')
add('n', '<C-S-k>', '<C-w>K')
add('n', '<C-S-l>', '<C-w>L')

-- Swap windows
add('t', '<C-S-h>', '<C-w>H')
add('t', '<C-S-j>', '<C-w>J')
add('t', '<C-S-k>', '<C-w>K')
add('t', '<C-S-l>', '<C-w>L')
