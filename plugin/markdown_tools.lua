if vim.g.loaded_markdown_tools == 1 then
    return
end

if vim.bo.filetype == "pandoc" or "markdown" then
    vim.api.nvim_exec("command! MarkdownImagePaste lua require'markdown_image_paste.modules'.MarkdownImagePaste()", true)
    vim.api.nvim_exec("command! MarkdownImageDelete lua require'markdown_image_paste.modules'.MarkdownImageDelete()", true)
    vim.api.nvim_exec("command! MarkdownGenPdf lua require'markdown_gen_doc.modules'.MarkdownGenPdf()", true)
elseif vim.bo.filetype == "tex" then
    vim.api.nvim_exec("command! TexImagePaste lua require'markdown_image_paste.modules'.TexImagePaste()", true)
    vim.api.nvim_exec("command! TexImageDelete lua require'markdown_image_paste.modules'.TexImageDelete()", true)
end

vim.g.loaded_markdown_tools = 1
