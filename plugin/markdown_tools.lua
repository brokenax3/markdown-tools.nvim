if vim.g.loaded_markdown_tools == 1 then
    return
end

if vim.bo.filetype == "markdown" then
    vim.api.nvim_exec(
        "command! MdxImgPaste lua require'markdown_image_paste.modules'.MdxImgPaste()",
        true
    )
    vim.api.nvim_exec(
        "command! MdxImgPasteRename lua require'markdown_image_paste.modules'.MdxImgPasteRename()",
        true
    )
    vim.api.nvim_exec(
        "command! MdxImgDelete lua require'markdown_image_paste.modules'.MdxImgDelete()",
        true
    )
    vim.api.nvim_exec(
        "command! MdxGenPdf lua require'markdown_gen_doc.modules'.MdxGenPdf()",
        true
    )
    vim.api.nvim_exec(
        "command! MdxGenPdf lua require'markdown_gen_doc.modules'.MdxGenHTML()",
        true
    )
elseif vim.bo.filetype == "tex" then
    vim.api.nvim_exec(
        "command! TexImgPaste lua require'markdown_image_paste.modules'.TexImgPaste()",
        true
    )
    vim.api.nvim_exec(
        "command! TexImgDelete lua require'markdown_image_paste.modules'.TexImgDelete()",
        true
    )
end

vim.g.loaded_markdown_tools = 1
