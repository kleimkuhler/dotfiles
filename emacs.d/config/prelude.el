;;; prelude.el --- Configurations that should run first

;;; Commentary:

;;; Code:

;; Redirect customizations into separate file
(let ((custom-path "~/.emacs.d/custom.el"))
  (if (not (file-exists-p custom-path))
      (with-temp-buffer (write-file custom-path)))
  (setq custom-file custom-path)
  (load custom-file))

;; Exec Path - add /usr/local/bin to exec path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(provide 'prelude)

;;; prelude.el ends here
