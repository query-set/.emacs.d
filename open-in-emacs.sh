#!/bin/bash

# The script aim to allow open file in Emacs on specific point from
# other applications/IDE.
# Thanks to that scipt on my daily work I use hybride of Emacs and PyCharm
# which leads me to make use of the greatest points of debugging skills
# of PyCharm and editing modes of Emacs.

# Note: You will use the PyCharm macros for invoke Emacs
#       like $FilePath$, $LineNumber$, $ColumnNumber$

# First argument is a file to open.
# If not delivered, Emacs will open Dired mode
# in current working directory.
file=$1

# Second and third arguments are coordinates of point in file.
# By default: line 1, column 1
line=${2:-1}
column=${3:-1}

# Use emacsclient for faster workflow.
#   -n no-wait for terminal
#   -c create-frame
#   -a "" alternate-editor: None
#   -e "" evaluate the following string
/usr/bin/emacsclient -n -c -a "" -e "
  (progn
    ;; Open given file.
    (find-file \"$file\")

    ;; Go to the point coordinates.
    (goto-line $line)
    (forward-char $column)

    ;; Focus on the opened frame.
    (raise-frame)

    ;; Be sensitive for any changes in current file.
    (auto-revert-mode t))"
