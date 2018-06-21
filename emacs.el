;; Basic UI
(column-number-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Basic global defaults
(setq-default indent-tabs-mode nil)

;; Basic buffer defaults
(setq inhibit-startup-message t
      initial-scratch-message nil)

;; Tame the backups
(setq backup-by-copying t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Exec Path - add /usr/local/bin to exec path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package golden-ratio
  :ensure t)

(use-package idris-mode
  :ensure t
  :mode "\\.idr\\'")

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
