 ;;; -*- lexical-binding: t -*-

(when (window-system)
  (scroll-bar-mode 0)
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (tooltip-mode 0)
  (fringe-mode 0))

(global-display-line-numbers-mode)

(use-package nord-theme
  :ensure t
  :config (load-theme 'nord t))
;;(load-theme 'adwaita t)
