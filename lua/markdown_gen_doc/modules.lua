local M = {}

local function check_paths()
    local target_dir = '../docs'

    if vim.fn.isdirectory(target_dir) == 0 then
        print('Output directory does not exist. Creating directory at ' .. target_dir)
        vim.api.nvim_command('!mkdir ' .. target_dir)
    end
end


function M.MarkdownGenPdf()

    local filename_markdown = vim.fn.expand('%')
    local filename_docs = vim.fn.expand('%'):gsub('.md', '.pdf')

    -- Check if the output path exists.
    check_paths()
    
    vim.api.nvim_command('!pandoc -V geometry:margin=1in ' .. filename_markdown .. ' -o ../docs/' .. filename_docs)

    print('Document Generated.')
end

return M
