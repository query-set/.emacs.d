;;; -*- lexical-binding: t -*-

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(fringe-mode -1)

(global-display-line-numbers-mode)

(use-package smooth-scrolling
  :demand
  t
  :custom
  (smooth-scroll-margin 6)
  :config
  (smooth-scrolling-mode t))

;; (use-package mood-line
;;   :ensure t
;;   :config (mood-line-mode))

;; (use-package mood-one-theme
;;   :demand t)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-city-lights t))

(use-package all-the-icons)

;; Don’t compact font caches during GC.
(setq inhibit-compacting-font-caches t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(add-to-list 'default-frame-alist '(font . "Roboto Mono-11"))
;;; appearance.el ends here
