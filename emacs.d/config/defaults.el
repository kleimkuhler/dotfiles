;;; defaults.el --- Set sane defaults

;;; Commentary:

;;; Code:

;; ----
;; Misc
;; ----

;; Deal with tabs
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Do not display anything on startup
(setq inhibit-startup-message t
      initial-scratch-message nil)

;; Tame the backups
(setq backup-by-copying t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Accept y/n at prompts instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Override default for making buffer names unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Go to the last place where file was previously visited
(require 'saveplace)
(setq-default save-place t)

(setq delete-selection-mode t
	  load-prefer-newer t
	  require-final-newline t
	  save-interprogram-paste-before-kill t
	  save-place-file (concat user-emacs-directory "places")
	  vc-follow-symlinks t
	  visible-bell t)


;; -------------------
;; Global key bindings
;; -------------------
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-rg)

(set-frame-font "Inconsolata-16" nil t)

;; -----
;; Hooks
;; -----
;; Delete trailing whitespace when file is saved
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; -------
;; Toggles
;; -------
;; Display column number
(column-number-mode 1)

;; Display line numbers
(global-display-line-numbers-mode)

;; Do not display menu bar
(menu-bar-mode -1)

;; Do not display scroll bar
(scroll-bar-mode -1)

;; Show matching parens
(show-paren-mode 1)

;; Do not display tool bar
(tool-bar-mode -1)

(provide 'defaults)

;;; defaults.el ends here
