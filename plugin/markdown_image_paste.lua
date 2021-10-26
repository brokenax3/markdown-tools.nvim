if vim.bo.filetype == 'pandoc' then
    vim.api.nvim_exec("command! MarkdownImagePaste lua require'markdown_image_paste.modules'.MarkdownImagePaste()", true)
    vim.api.nvim_exec("command! MarkdownImageDelete lua require'markdown_image_paste.modules'.MarkdownImageDelete()", true)
elseif vim.bo.filetype == 'tex' then
    vim.api.nvim_exec("command! TexImagePaste lua require'markdown_image_paste.modules'.TexImagePaste()", true)
    vim.api.nvim_exec("command! TexImageDelete lua require'markdown_image_paste.modules'.TexImageDelete()", true)
end
