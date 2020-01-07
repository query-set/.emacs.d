 ;;; -*- lexical-binding: t -*-

(prefer-coding-system 'utf-8)

(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      initial-scratch-message nil
      inhibit-startup-message t
      enable-recursive-minibuffers t)

(setq electric-pair-pairs
      '(
	(?` . ?`)
	(?\{ . ?\})))

(electric-pair-mode 1)
(save-place-mode)
(global-subword-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defalias 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)

(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun intendation-or-begin ()
  (interactive)
   (if (= (point) (progn (back-to-indentation) (point)))
       (beginning-of-line)))
(global-set-key (kbd "C-q") 'intendation-or-begin)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("python" "emacs-lisp"))))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
