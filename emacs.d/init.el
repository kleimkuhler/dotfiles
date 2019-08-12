;;; init.el --- Initialize Emacs

;;; Commentary:

;;; Code:

;; Add configurations path
(add-to-list 'load-path (expand-file-name "config" "~/.emacs.d"))

;; Load configurations in the following order
(require 'prelude)
(require 'packages)
(require 'defaults)

;; Weird MacOS error: https://stackoverflow.com/questions/52521587/emacs-error-when-i-call-it-in-the-terminal
(delete-file "~/Library/Colors/Emacs.clr")

;;; init.el ends here
