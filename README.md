# markdown-image-paste.nvim
Paste screenshots into Markdown files. 

This plugin moves the screenshot to a `images` folder in the current working directory.

## Workflow: Markdown
```bash
# This is an example path of a screenshot taken.
# This screenshot will be moved to the new path. The original is removed.
/default/picture/screenshot.png

# After calling MarkdownImagePaste, the new filename will be
/current/directory/images/screenshot.png

# ![](/current/directory/images/screenshot.png) will be pasted into the current line.

# Calling MarkdownImageDelete deletes the image with the link under the current line.
# The current line along with the image will be removed.
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
Make sure your desired screenshot workflow sends the image path to the clipboard.

Then, set `vim.g.markdown-image-paste` to a directory which will contain all the screenshots. 

### Example: Screenshot Script
```bash
FILENAME=~/Pictures/$(date "+%s").png
maim -s --hidecursor $FILENAME

echo "$FILENAME" | xclip
```

### Example: Configuration
```lua
vim.g.markdown-image-paste = '/your/default/screenshots/directory'

```

## Commands
Functions           | Description
--------------------| --------------------------------------------------------------------
MarkdownImagePaste  | Paste the image on the clipboard into the current working directory.
MarkdownImageDelete | Prompts to delete the image under the line.
TexImagePaste | Paste the image on the clipboard to the current working directory.
TexImageDelete | Prompts to delete the image under the line.

