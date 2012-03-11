## Overview

This little utility can be used to choose a random selection of files from a
given directory and output the list to stdout. The invocation looks like this:

    randfiles [options] [dir1, [dir2, [...]]]

If no directories are given, the current directory is used. The possible options are:

  - `-s, --size-limit [SIZE]`: Set a size limit for the selected files. For
    example, `randfiles --size-limit 400MB` will select up to 400MB of files.
  - `-c --count [N]`: Set the maximum number of files. `randfiles --count 3`
    would only choose three random files.

## Examples

To copy a random selection of music to a flash drive, limited to 3GB, you can do
this:

    randfiles --size-limit 3GB ~/music | xargs -i -d'\n' cp -v {} /mnt/usb

If you're unfamiliar with xargs:

  - `-i` replaces all occurrences of `{}` with what's read as input
  - `-d'\n'` ensures that the items are delimited by newlines (there may be
    spaces in the file names)

## Todo

- A `-0` option for easier piping
- Filtering files by regex or glob
