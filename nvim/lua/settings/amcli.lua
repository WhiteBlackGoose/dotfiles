-- https://stackoverflow.com/questions/132397/get-back-the-output-of-os-execute-in-lua
function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

local function visual_selection_range()
    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
    if csrow < cerow or (csrow == cerow and cscol <= cecol) then
        return csrow - 1, cscol - 1, cerow - 1, cecol
    else
        return cerow - 1, cecol - 1, csrow - 1, cscol
    end
end
    
-- https://neovim.discourse.group/t/function-that-return-visually-selected-text/1601
local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

-- https://www.reddit.com/r/neovim/comments/psux8f/how_to_use_a_lua_function_to_insert_text/
local function write_to_cursor(text)
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. text .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)
end

local function clean_selection()
    _, x1, _, x2 = visual_selection_range()
    local line = vim.api.nvim_get_current_line()
    local newline = line:sub(0, x1) .. line:sub(x2)
    vim.api.nvim_set_current_line(newline)
end
  
function Amcli(fmt, cmd)
    y1, x1, y2, x2 = visual_selection_range()
    if y1 ~= y2 then
        print("Cannot do multilines")
        return
    end
    local txt = get_visual_selection()
    clean_selection()
    local converted = os.capture("AMCLI_PRECISION=8 amcli " .. cmd .. " \"" .. txt .. "\" 2> /dev/null", false)
    write_to_cursor(string.format(fmt, converted))
end

vim.cmd[[
:command AmcliLatex lua Amcli('%s', 'latex')
:command AmcliLatexLine lua Amcli('$%s$', 'latex')
:command AmcliLatexBlock lua Amcli('$$%s$$', 'latex')
:command AmcliSimp lua Amcli('%s', 'simp')
:command AmcliEval lua Amcli('%s', 'eval')
]]
