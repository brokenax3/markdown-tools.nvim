local M = {}

local function check_paths()
    local target_dir = '..' .. vim.fn.getcwd(0) .. 'docs'

    if vim.fn.isdirectory(target_dir) == 0 then
        print('Output directory does not exist. Creating directory at ' .. target_dir)
        vim.api.nvim_command('!mkdir ' .. target_dir)
    end
end


function M.MarkdownGenPdf()

    local filename_markdown = vim.fn.expand('%') .. '.md'
    local filename_docs = vim.fn.expand('%') .. '.pdf'

    -- Check if the output path exists.
    check_paths()
    
    vim.api.nvim_command('!pandoc -V geometry:margin=1in ' .. filename_markdown .. ' -o ' .. filename_docs)

    print('Document Generated.')
end

return M
