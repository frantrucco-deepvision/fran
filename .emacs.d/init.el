;;; init.el --- Emacs configuration file

;;; Commentary:
;; Personal configuration file

;;; Code:

(package-initialize)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  "Load a FILE in current user's configuration directory."
  (interactive "f")
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "prelude.el")
(load-user-file "common_customizations.el")
(load-user-file "packages.el")
(load-user-file "bindings.el")
(load-user-file "aesthetics.el")

;;; init.el ends here
