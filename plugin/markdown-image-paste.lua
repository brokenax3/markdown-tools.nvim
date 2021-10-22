if vim.bo.filetype == 'pandoc' then
    vim.api.nvim_exec("command! MarkdownImagePaste lua require'markdown-paste'.MarkdownImagePaste()", true)
end
