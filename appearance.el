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

(use-package mood-line
  :ensure t
  :config (mood-line-mode))

(use-package mood-one-theme
  :demand t)

;; (set-face-attribute 'default nil :font "Roboto Mono-11")
;; (set-frame-font "Roboto Mono" nil t)  ;; emacsclient comes out shrunk af
(add-to-list 'default-frame-alist '(font . "Roboto Mono-11"))
