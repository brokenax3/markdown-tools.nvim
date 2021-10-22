if vim.bo.filetype == 'pandoc' then
    vim.api.nvim_exec("command! MarkdownImagePaste lua require'markdown_image_paste.modules'.MarkdownImagePaste()", true)
    vim.api.nvim_exec("command! MarkdownImageDelete lua require'markdown_image_paste.modules'.MarkdownImageDelete()", true)
end
