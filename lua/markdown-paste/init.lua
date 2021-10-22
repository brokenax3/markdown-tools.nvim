local M = {}

local function is_screenshot(filepath)
    local file = io.open(filepath, 'r')
    if file~=nil then io.close(file) return true else return false end
end

local function send_to_cwd(filepath, currentDirectory)
    local ssDirectory = '/home/mark/Pictures/'
    local filename = filepath:gsub(ssDirectory, '')
    
    return currentDirectory .. filename
end

function M.MarkdownImagePaste()
    local imgDirectory = vim.fn.getcwd(0) .. '/images/'
    
    if vim.fn.isdirectory(imgDirectory) == false then
        print('Image directory does not exist. Creating images directory...')
        vim.api.nvim_command('!mkdir ' .. imgDirectory)
    end

    local file = vim.fn.getreg('*'):gsub('\n', '')
    if is_screenshot(file) then
        local n_file = send_to_cwd(file, imgDirectory)
        local imagetext = '![](' .. n_file .. ')'
        vim.api.nvim_command('!mv ' .. file .. ' ' .. n_file)

        vim.api.nvim_paste(imagetext, 0, -1)
        print('Image link is pasted into the buffer')
    else
        print('Not a screenshot')
    end

end

function M.MarkdownImageDelete()
    -- Test if the string under the cursor matches '![]'
    local imagetext = vim.fn.getline('.')

    if imagetext:find('!%b[]') ~= nil then
        local file = imagetext:match('!%[.*]%((.+)%)')
        
        if is_screenshot(file) then
            if vim.fn.input('File ' .. file .. ' found. Delete? (y/n) ') == 'y' then
                vim.api.nvim_command('!rm ' .. file)
                vim.api.nvim_del_current_line()
            else
                print('File ' .. file .. ' not deleted.')
            end
        else
            print('File not found.')
        end
    end
end

return M
