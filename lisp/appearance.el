;;; -*- lexical-binding: t -*-

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(fringe-mode -1)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)
(electric-pair-mode t)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; bold is universally disabled
        doom-themes-enable-italic t) ; italics is universally disabled
  (load-theme 'doom-oceanic-next t))
;; :dark doom-city-lights
;; :light doom-one-light adwaita

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 40))

(use-package all-the-icons
  :ensure t
  ;; Don’t compact font caches during GC.
  :config
  (setq inhibit-compacting-font-caches t))

(defun enable-doom-modeline-icons (_frame)
  (setq doom-modeline-icon t))

(add-hook 'after-make-frame-functions #'enable-doom-modeline-icons)

(add-to-list 'default-frame-alist
	     '(font . "SF Mono Powerline-11"))

;;; appearance.el ends here
