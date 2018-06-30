;; Never indent with tabs
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

;; Follow symlinks
(setq vc-follow-symlinks t)

;; Accept y/n at prompts instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; When typing after selecting a region, delete that region
(delete-selection-mode t)

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

;; Do not display menu bar
(menu-bar-mode -1)

;; Do not display scroll bar
(scroll-bar-mode -1)

;; Do not display tool bar
(tool-bar-mode -1)

(provide 'defaults)
