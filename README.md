# markdown-tools.nvim
This is a collection of Markdown/ LaTeX Lua Commands that I use on a daily
basis.

This works with Linux systems and MacOS (The setup for screenshot and save path
to clipboard is more annoying on this one). In this case if using Alacritty,
one must define a shortcut as follows:

```yaml
key_bindings:
  - { key: X,              mods: Command|Shift,                   command: {program: "/usr/bin/shortcuts", args: ["run", "Screenshot and Copy Path"]}}

# Note that "Screenshot and Copy Path" is a shortcut created on MacOS. This is shown below in the scripts section.
```

## Requirements
- Pandoc

## Installation
```lua
{
    "brokenax3/markdown-tools.nvim",
    ft = { "markdown", "tex" },
    config = function()
        -- This is where you store your configuration file
        require("plugins.markdown-image") 
    end,
})
```

## Features
- MdxImgPaste
- MdxImgPasteRename
- MdxImgDelete
- MdxGenPdf
- MdxGenHTML
- TexImgPaste
- TexImgDelete

## Workflow: Markdown
```bash
# This is an example path of a screenshot taken.
# This screenshot will be moved to the new path. The original is removed.
/default/picture/screenshot.png

# After calling MdxImgPaste, the new filename will be
/current/directory/buffername/images/screenshot.png

# ![](/current/directory/buffername/images/screenshot.png) will be pasted into the current line.

# Calling MdxImgDelete deletes the image with the link under the current line.
# The current line along with the image will be removed.

# Do a `yi)` in within the () of the image link.
# Calling MdxImgPasteRename will do a `mv` which renames the file in the same image directory.
# A prompt will ask the user for the new filename.
# The file will be pasted into the current line.

# ![](/current/directory/images/new_name_screenshot.png) will be pasted into the current line.

# MdxImgPasteRename works as well without having to call MdxImgPaste the first time.
# It does the same thing with the addition of being able to rename the file.
```

## Workflow: LaTeX
```bash
# This is similar to Markdown but with two key changes.
#   1. The input text is as follows.
#
#       \begin{figure}[htbp]
#           \centering
#           \includegraphics[width=0.7\textwidth, height=8cm]{image.png}
#           \caption{}
#           \label{fig:}
#       \end{figure}
#   2. Deleting the image only works when the cursor is at the first line of the figure block. 
#       This means that deleting figures is hardcoded. *Use at your own risk*. It also does not
#       work with subfigures. I might do something about this when I have the time.
```

## Configuration
Make sure your desired screenshot workflow sends the image path to the
clipboard.

Then, set `vim.g.markdown-image-paste` to a directory which will contain all
the screenshots. 

### Example: Screenshot Script (Linux)

Make sure your screenshot script sends the path of the screenshot to the
clipboard.

```bash
#!/bin/bash

FILENAME=~/Pictures/$(date "+%s").png
maim -s --hidecursor $FILENAME

echo "$FILENAME" | xclip
```

### Example: Screenshot Script (MacOS)

Create a Shortcut which receives any input. Keybindings may not work in all applications.

```bash
#!/bin/bash
FILE=~/Desktop/$(date "+%s").png

screencapture -i $FILE
echo "$FILE" | pbcopy
```

### Example: Configuration

```lua

vim.g.markdown_tools = {
    ssdir = '/your/default/screenshots/directory',
    subdir = true,
}
```

## Commands

Functions            | Description
-------------------- | -------------------------------------------------------------------------------
MdxImgPaste          | Paste the image on the clipboard into the current working directory.
MdxImgPasteRename    | Paste the image on the clipboard into the current working directory and rename.
MdxImgDelete         | Prompts to delete the image under the line.
MdxGenPdf            | Generates a pdf output of the current file using Pandoc.
TexImgPaste          | Paste the image on the clipboard to the current working directory.
TexImgDelete         | Prompts to delete the image under the line.

# Changelog

## Jul 29, 2022

- Images are now saved to `CURRENT_WORKING_DIR/images/BUFFER_FILENAME/`
- Verified to be working on MacOS as well
