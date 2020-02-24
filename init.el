 ;;; -*- lexical-binding: t -*-


;;; Code:

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

(load "~/.emacs.d/packages.el" nil t)
(load "~/.emacs.d/appearance.el" nil t)
(load "~/.emacs.d/behavior.el" nil t)
(load "~/.emacs.d/sql.el" nil t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)


;;;; list of really interesting emacs dotfiles
;; https://gitlab.com/jessieh/dot-emacs/blob/master/init.el

(provide 'init)
;;; init.el ends here
