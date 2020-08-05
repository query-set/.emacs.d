;;; package --- Summary
;;; Commentary:
;;; -*- lexical-binding: t -*-

;;; Code:
(defvar init-file/gc-cons-threshold 8000000)
(defvar init-file/gc-cons-percentage 0.1)

;; Define some functions for deferring and restoring Emacs' garbage collection facilities.
(defun defer-garbage-collection ()
  "Set the garbage collection threshold to the highest possible for collection avoidance."
  (setq gc-cons-threshold most-positive-fixnum
        gc-cons-percentage 0.6))
(defun restore-garbage-collection ()
  "Restore the garbage collection threshold parameters in a deferred fashion."
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold init-file/gc-cons-threshold
                          gc-cons-percentage init-file/gc-cons-percentage))))

;; Defer garbage collection while Emacs is starting and restore the threshold to 8MB when we're done.
(defer-garbage-collection)
(add-hook 'emacs-startup-hook #'restore-garbage-collection)

;; Similarly raise and restore the garbage collection threshold for minibuffer commands.
(add-hook 'minibuffer-setup-hook #'defer-garbage-collection)
(add-hook 'minibuffer-exit-hook #'restore-garbage-collection)

;; Collect all garbage whenever Emacs loses focus.
(add-hook 'focus-out-hook #'garbage-collect)

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

(defvar module-directory (expand-file-name "lisp" user-emacs-directory)
  "Directory containing configuration 'modules'.")

(defmacro insert-code-from-file (path)
  "Read the forms in the file at PATH into a progn."
  (with-temp-buffer
    (insert-file-contents path)
    (goto-char (point-min))
    (let (forms (eof nil))
      (while (not eof)
        (condition-case nil
            (push (read (current-buffer)) forms)
          (end-of-file (setq eof t))))
      `(progn ,@(reverse forms)))))

(defmacro load-module (name)
  "Locate the module NAME and insert its contents as a progn."
  (let* ((file-name (concat name ".el"))
         (path (expand-file-name file-name module-directory)))
    `(insert-code-from-file ,path)))

(load-module "packages")
(load-module "appearance")
(load-module "functions")
(load-module "behavior")
(load-module "sql")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;; List of really interesting Emacs dotfiles
;; https://gitlab.com/jessieh/dot-emacs/blob/master/init.el
;; https://git.sr.ht/~jakob/.emacs.d/tree/master/init.el

(provide 'init)
;;; init.el ends here
