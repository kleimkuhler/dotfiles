;;; packages.el --- Package settings

;;; Commentary:

;;; Code:

(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(defvar use-package-always-ensure)
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

;; Company-mode for autocompletion
(use-package company
  :config (global-company-mode))

;; Jump to definition
(use-package dumb-jump
  :init (dumb-jump-mode)
  :config (setq dumb-jump-selector 'ivy))

;; Use the $PATH set up by shell
(use-package exec-path-from-shell
  :config
  (dolist (var '("GOPATH"))
	(add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))

(use-package flycheck
  :init (global-flycheck-mode))

;; Golden-ratio for buffer sizing
(use-package golden-ratio)

;; Golang-mode
(use-package go-mode
  :mode "\\.go\\'")

;; Idris-mode
(use-package idris-mode
  :mode "\\.idr\\'")

;; Ivy for generic completion frontend
(use-package ivy
  :demand
  :config
  (setq enable-virtual-buffers t
        ivy-count-format "%d/%d "
        ivy-height 10
        ivy-mode 1
        ivy-use-virtual-buffers t))

;; Racket-mode
(use-package racket-mode
  :mode "\\.rkt\\'"
  :config
  (add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
  (add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable))

;; Rust-mode
(use-package rust-mode
  :mode "\\.rs\\'")

;; Solarized-theme that defaults to light
(use-package solarized-theme
  :config (load-theme 'solarized-light t))

(provide 'packages)

;;; packages.el ends here
