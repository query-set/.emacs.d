;;; -*- lexical-binding: t; -*-

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(global-set-key [(control meta up)]  'move-line-up)

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key [(control meta down)]  'move-line-down)

(defun my-revert-buffer-noconfirm ()
  "Call `revert-buffer' with the NOCONFIRM argument set."
  (interactive)
  (revert-buffer nil t))
(global-set-key (kbd "C-c r") 'revert-buffer)

(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(defun config-visit ()
  "Visits your own configuration."
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun intendation-or-begin ()
  "~Smart~ backing to beginning to start of the line."
  (interactive)
   (if (= (point) (progn (back-to-indentation) (point)))
       (beginning-of-line)))
(global-set-key (kbd "C-a") 'intendation-or-begin)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("python" "emacs-lisp"))))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f12] 'indent-buffer)

;;; functions.el ends here
