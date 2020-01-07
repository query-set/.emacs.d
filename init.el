 ;;; -*- lexical-binding: t -*-

(setq gc-cons-threshold 32000000
      garbage-collection-messages t)
(setq max-lisp-eval-depth 2000)

(require 'package)
(defmacro append-to-list (target suffix)
  "Append SUFFIX to TARGET in place."
  `(setq ,target (append ,target ,suffix)))

(append-to-list package-archives
                '(("melpa" . "http://melpa.org/packages/")
                  ("melpa-stable" . "http://stable.melpa.org/packages/")
                  ("org-elpa" . "https://orgmode.org/elpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load "~/.emacs.d/packages" nil t)
(load "~/.emacs.d/appearance" nil t)
(load "~/.emacs.d/behavior" nil t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
