;; Add configurations path
(add-to-list 'load-path (expand-file-name "config" "~/.emacs.d"))

;; Load configurations in the following order
(require 'prelude)
(require 'defaults)
(require 'packages)
