;; -*- lexical-binding: t -*-

;;; Package management.
(require 'package)

(defmacro append-to-list (target suffix)
  "Append SUFFIX to TARGET in place."
  `(setq ,target (append ,target ,suffix)))

(append-to-list package-archives
                '(("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;; Garbage collector.

(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)

;; https://gitlab.com/koral/gcmh/
(use-package gcmh :defer t)
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 33554432) ; 16mb
    (setq gc-cons-percentage 0.1)
    (require 'gcmh)
    (gcmh-mode 1)))


;;; Modules.

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
(load-module "python")
(load-module "appearance")
(load-module "functions")
(load-module "behavior")
(load-module "sql")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;; List of really interesting Emacs dotfiles
;; https://gitlab.com/jessieh/dot-emacs/blob/master/init.el
;; https://git.sr.ht/~jakob/.emacs.d/tree/master/init.el
;; https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org

(provide 'init)
;;; init.el ends here
