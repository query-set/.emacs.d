;;; -*- lexical-binding: t -*-

(prefer-coding-system 'utf-8)

(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      initial-scratch-message nil
      inhibit-startup-message t
      enable-recursive-minibuffers t
      auto-revert-mode t
      mouse-wheel-progressive-speed nil
      visible-bell 1
      ring-bell-function 'ignore
      electric-pair-mode t
      global-subword-mode t
      delete-selection-mode t)

(setq electric-pair-pairs
      '(
	(?` . ?`)
	(?\{ . ?\})))

(save-place-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defalias 'yes-or-no-p 'y-or-n-p)

;;;; Python config
;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(add-hook 'prog-mode-hook 'subword-mode)

;; "Command attempted to use minibuffer while in minibuffer" gets old fast.
(setq enable-recursive-minibuffers t)

;; Select help windows when I pop them so that I can kill them with <q>.
(setq help-window-select t)

;; Most *NIX tools work best when files are terminated with a newline.
(setq require-final-newline t)

;; Allow replacing highlighted text with what one type
(delete-selection-mode 1)

(setq jit-lock-defer-time 0.05)

;;; behavior.el ends here
