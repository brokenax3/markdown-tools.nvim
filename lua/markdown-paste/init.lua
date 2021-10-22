local M = {}

local function is_screenshot(filepath)
    local file = io.open(filepath, 'r')
    if file~=nil then io.close(file) return true else return false end
end

local function send_to_cwd(filepath)
    local currentDirectory = vim.fn.getcwd(0)
    local ssDirectory = '/home/mark/Pictures/'
    local filename = filepath:gsub(ssDirectory, '')

    -- Make new directory string
    return currentDirectory .. '/' .. filename
end

function M.MarkdownImagePaste()

    local file = vim.fn.getreg('*'):gsub('\n', '')
    if is_screenshot(file) then
        local n_file = send_to_cwd(file)
        local imagetext = '![](' .. n_file .. ')'
        vim.api.nvim_command('!mv ' .. file .. ' ' .. n_file)

        vim.api.nvim_paste(imagetext, 0, -1)
        print('Image link is pasted into the buffer')
    else
        print('Not a screenshot')
    end
end

return M
