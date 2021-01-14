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

(use-package multiple-cursors
  :ensure t
  :config (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines))

(use-package avy
  :ensure t
  :bind ("C-q" . avy-goto-char))

(use-package docker-tramp
  :ensure t
  :config (setq docker-tramp-use-names t))

(use-package dockerfile-mode
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

(use-package restclient
  :mode (("\\.http\\'" . restclient-mode)
	 ("\\.https\\'" . restclient-mode))
  :ensure t
  :config (setq restclient-inhibit-cookies t))

(use-package cider
  :ensure t)

(use-package git-identity
  :after magit
  :config
  (git-identity-magit-mode 1)
  ;; Bind I to git-identity-info in magit-status
  (define-key magit-status-mode-map (kbd "I") 'git-identity-info)
  :custom
  ;; Warn if the global identity setting violates your policy
  (git-identity-verify t)
  ;; The default user name
  (git-identity-default-username "query-set"))

;; And set git-identity-list in your custom-file or init file
(setq git-identity-list
      '(("j3k.walczak@gmail.com"
	 :name "query-set"
         :domains ("github.com")
         :dirs ("~/.emacs.d" "~/exercism"))
        ("jacek.walczak@profil-software.com"
	 :name "jacek-walczak-profil-software"
         :domains ("github.com")
         :dirs ("~/work"))))

(use-package magit-todos
  :ensure t
  :config (add-hook 'prog-mode-hook 'magit-todos-mode)) ;; TODO: make it working

(use-package expand-region
  :ensure t)
(global-set-key (kbd "C-=") 'er/expand-region)  ; maybe to C-z someday?

(use-package js2-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  ;; :init (setq markdown-command "multimarkdown"))
  ;; (custom-set-variables
  ;;  '(markdown-command "/usr/local/bin/pandoc"))
  :init (setq markdown-command "/usr/bin/pandoc"))

(provide 'packages)
;;; packages.el ends here
