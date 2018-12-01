(package-initialize)

;; Install org-mode if not present
(unless (file-directory-p "~/.emacs.d/org-mode")
        (shell-command "cd ~/.emacs.d;
                        git clone https://code.orgmode.org/bzg/org-mode.git;
                        cd org-mode; make autoloads"))

;; Load org-mode before using it!
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)

;; Load the configuration file
(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coq-prog-name
   "/home/fran/.opam/opam-coq.8.8.1/4.02.3/bin/coqtop -Q . Top")
 '(package-selected-packages
   (quote
    (dracula-theme yasnippet-snippets which-key use-package tuareg super-save spaceline smartparens ranger projectile org-ref org-bullets neotree merlin markdown-mode latex-math-preview haskell-mode google-translate git-wip-timemachine git-timemachine flycheck fill-column-indicator eyebrowse evil-surround evil-mc evil-magit evil-leader evil-collection doom-themes company-coq avy auctex ag)))
 '(proof-three-window-enable t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
