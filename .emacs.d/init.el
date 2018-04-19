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

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (evil-magit magit-evil magit zop-to-char yaml-mode which-key volatile-highlights use-package super-save rainbow-mode rainbow-delimiters projectile powerline-evil move-text markdown-mode inf-ruby imenu-anywhere helm flycheck expand-region exec-path-from-shell evil-leader erlang elixir-mode easy-kill diff-hl crux counsel company cider cask-mode avy atom-one-dark-theme atom-dark-theme anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
