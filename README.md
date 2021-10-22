# markdown-image-paste.nvim
Paste screenshots into Markdown files. 

This plugin moves the screenshot to a `images` folder in the current working directory.

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

