 ;;; -*- lexical-binding: t -*-

(require 'use-package)
(setq use-package-always-ensure t
      use-package-verbose t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package json-mode
  :ensure t)

(use-package swiper
  :ensure t
  :bind ("C-s" . 'swiper))

(use-package flx-ido
  :ensure t)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere t)
(flx-ido-mode 1)

;; Disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t
      ido-use-faces nil)

;; Display ido results vertically, rather than horizontally.
(setq ido-decorations
      (quote
       ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))


;; Python packages
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-copy-env "PATH"))

(use-package elpy
  :ensure t
  :config (elpy-enable))

(use-package py-autopep8
  :ensure t
  :hook ('elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package blacken
  :ensure t)

(use-package ein)

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode)
;;   ;;:hook (add-hook 'elpy-mode-hook 'flycheck-mode)
;;   )

;; (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake 'flymake--backend-state)
;; (global-flycheck-mode 1)

(use-package avy
  :ensure t
  :bind ("C-q" . avy-goto-char))

(use-package company
  :bind (("C-." . company-complete))
  :diminish company-mode
  :custom
  (company-dabbrev-downcase nil "Don't downcase returned candidates.")
  (company-show-numbers t "Numbers are helpful.")
  (company-tooltip-limit 20 "The more the merrier.")
  (company-abort-manual-when-too-short t "Be less enthusiastic about completion.")
  :config
  ;; Jump faster.
  (setq company-idle-delay 0)
  ;; Company mode in all buffers by default.
  (add-hook 'after-init-hook 'global-company-mode)

  ;; Use numbers 0-9 to select company completion candidates.
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
                        `(lambda () (interactive) (company-complete-number ,x))))
          (number-sequence 0 9))))
(global-set-key (kbd "C-c c") 'global-company-mode)

(use-package docker-tramp
  :ensure t)

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package autorevert
  ;; Automatically revert buffers and dired listings when something on disk
  ;; changes.
  :config (global-auto-revert-mode 1)
  (setq global-auto-revert-non-file-buffers t
        auto-revert-verbose nil))

;;; packages.el ends here
