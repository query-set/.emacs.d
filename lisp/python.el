;;; -*- lexical-binding: t -*-

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-copy-env "PATH"))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package py-autopep8
  :ensure t
  :hook ('elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package blacken
  :ensure t)

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (setq elpy-shell-echo-input nil))

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; (defun company-yasnippet-or-completion ()
;;   "Solve company yasnippet conflicts."
;;   (interactive)
;;   (let ((yas-fallback-behavior
;;          (apply 'company-complete-common nil)))
;;     (yas-expand)))

;; (add-hook 'company-mode-hook
;;           (lambda ()
;;             (substitute-key-definition
;;              'company-complete-common
;;              'company-yasnippet-or-completion
;;              company-active-map)))

;; (when (load "flycheck" t t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; (require 'ein)
;; (require 'ein-notebook)
;; (require 'ein-subpackages)

;; That shit is really annoying...
;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode)
;;   :hook (add-hook 'elpy-mode-hook 'flycheck-mode))

;; (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake 'flymake--backend-state)
;; (global-flycheck-mode 1)

(provide 'python)
;;; python.el ends here
