if vim.g.loaded_markdown_tools == 1 then
    return
end

vim.api.nvim_exec(
    "command! MdxImgPaste lua require'markdown_image_paste.modules'.MdxImagePaste()",
    true
)
vim.api.nvim_exec(
    "command! MdxImgPasteRename lua require'markdown_image_paste.modules'.MdxImagePasteRename()",
    true
)
vim.api.nvim_exec(
    "command! MdxImgDelete lua require'markdown_image_paste.modules'.MdxImageDelete()",
    true
)
vim.api.nvim_exec(
    "command! MdxGenPdf lua require'markdown_gen_doc.modules'.MdxGenPdf()",
    true
)
vim.api.nvim_exec(
    "command! TexImgPaste lua require'markdown_image_paste.modules'.TexImagePaste()",
    true
)
vim.api.nvim_exec(
    "command! TexImgDelete lua require'markdown_image_paste.modules'.TexImageDelete()",
    true
)

vim.g.loaded_markdown_tools = 1
