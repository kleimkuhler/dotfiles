(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

;; Company-mode for autocompletion
(use-package company
  :config (global-company-mode))

;; Golden-ratio for buffer sizing
(use-package golden-ratio)

;; Idris-mode
(use-package idris-mode
  :mode "\\.idr\\'")

;; Racket-mode
(use-package racket-mode
  :mode "\\.rkt\\'"
  :config
  (add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
  (add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable))

;; Solarized-theme that defaults to light
(use-package nord-theme
  :config (load-theme 'nord t))

(provide 'packages)
