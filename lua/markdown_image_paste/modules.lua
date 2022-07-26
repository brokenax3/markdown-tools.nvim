local M = {}

local function is_screenshot(filepath)
    if string.find(filepath, "%.png$") or string.find(filepath, "%.jpg$") then
        local file = io.open(filepath, "r")
        if file ~= nil then
            io.close(file)
            return true
        else
            return false
        end
    else
        return false
    end
end

local function send_to_cwd(filepath, currentDirectory)
    local ssDirectory = vim.g.markdown_image_paste
    local filename = filepath:gsub(ssDirectory, "")

    return currentDirectory .. filename
end

function M.MdxImgPaste()
    if vim.g.markdown_image_paste == nil then
        print("Image directory not set")
        return
    end
    local imgDirectory = vim.fn.getcwd(0) .. "/images/"

    if vim.fn.isdirectory(imgDirectory) == 0 then
        print("Image directory does not exist. Creating images directory...")
        vim.api.nvim_command("!mkdir " .. imgDirectory)
    end

    local file = vim.fn.getreg("+"):gsub("\n", "")
    -- print(file)
    if is_screenshot(file) then
        local n_file = send_to_cwd(file, imgDirectory)
        local imagetext = "![](" .. n_file .. ")"
        vim.api.nvim_command("!mv " .. file .. " " .. n_file)

        vim.api.nvim_paste(imagetext, 0, -1)
        print("Image link is pasted into the buffer")
    else
        print(file .. " is not a screenshot")
    end
end

function M.MdxImgPasteRename()
    if vim.g.markdown_image_paste == nil then
        print("Image directory not set")
        return
    end
    local imgDirectory = vim.fn.getcwd(0) .. "/images/"

    if vim.fn.isdirectory(imgDirectory) == 0 then
        print("Image directory does not exist. Creating images directory...")
        vim.api.nvim_command("!mkdir " .. imgDirectory)
    end

    local file = vim.fn.getreg("+"):gsub("\n", "")
    if is_screenshot(file) then
        local n_filename = vim.fn.input("Enter new filename: ")
        local n_pathname = imgDirectory .. n_filename .. ".png"
        local imagetext = "![](" .. n_pathname .. ")"
        vim.api.nvim_command("!mv " .. file .. " " .. n_pathname)

        vim.api.nvim_paste(imagetext, 0, -1)
        print("Image link is pasted into the buffer")
    else
        print(file .. " is not a screenshot")
    end
end

function M.MdxImgDelete()
    -- Test if the string under the cursor matches '![]'
    local imagetext = vim.fn.getline(".")

    if imagetext:find("!%b[]") ~= nil then
        local file = imagetext:match("!%[.*]%((.+)%)")

        if is_screenshot(file) then
            if vim.fn.input("File " .. file .. " found. Delete? (y/n) ") == "y" then
                vim.api.nvim_command("!rm " .. file)
                vim.api.nvim_del_current_line()
            else
                print("File " .. file .. " not deleted.")
            end
        else
            print("File not found.")
        end
    end
end

function M.TexImgPaste()
    if vim.g.markdown_image_paste == nil then
        print("Image directory not set")
        return
    end
    local imgDirectory = vim.fn.getcwd(0) .. "/images/"

    if vim.fn.isdirectory(imgDirectory) == 0 then
        print("Image directory does not exist. Creating images directory...")
        vim.api.nvim_command("!mkdir " .. imgDirectory)
    end

    local file = vim.fn.getreg("+"):gsub("\n", "")
    if is_screenshot(file) then
        local n_file = new_dir_rename(file, imgDirectory)
        local relative_link = n_file:match("(images/.*)")
        local imagetext = [=[\begin{figure}[htbp]]=]
            .. "\n    \\centering\n    \\includegraphics[width=0.7\\textwidth, height=8cm]{%s}\n    \\caption{}\n    \\label{fig:}\n\\end{figure}\n"

        vim.api.nvim_command("!mv " .. file .. " " .. n_file)

        vim.api.nvim_paste(string.format(imagetext, relative_link), 0, -1)
        print("Image link is pasted into the buffer")
    else
        print(file .. " is not a screenshot")
    end
end

function M.TexImgDelete()
    -- Test if the string under the cursor matches '![]'
    local start = vim.fn.line(".")
    local endt = start + 2

    if vim.fn.getline(start):find("\\begin{figure}") ~= nil then
        local file = vim.fn.getline(endt):match("(images/.+)}")
        local filename = vim.fn.getcwd(0) .. "/" .. file
        -- print(filename)

        if is_screenshot(filename) then
            if vim.fn.input("File " .. file .. " found. Delete? (y/n) ") == "y" then
                vim.api.nvim_command("silent !rm " .. filename)
                vim.api.nvim_command("silent " .. start .. "del 6")

                print("File " .. file .. " deleted.")
            else
                print("File " .. file .. " not deleted.")
            end
        else
            print("File not found.")
        end
    end
end

return M
