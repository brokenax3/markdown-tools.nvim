if vim.bo.filetype == 'pandoc' then
    vim.api.nvim_exec("command! MarkdownImagePaste lua require'markdown-paste'.MarkdownImagePaste()", true)
    vim.api.nvim_exec("command! MarkdownImageDelete lua require'markdown-paste'.MarkdownImageDelete()", true)
end
