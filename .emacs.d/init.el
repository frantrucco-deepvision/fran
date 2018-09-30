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

;; ----------------------------------------------------------------------------
;; ----------------------------------------------------------------------------
;; ----------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coq-prog-name "~/.opam/opam-coq.8.8.1/4.02.3/bin/coqtop")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (auctex ag projectile company-coq yasnippet-snippets yasnippet evil-avy avy ox-ipynb outline-magic latex-math-preview preview-latex google-translate org-contrib org-ref helm-bibtex spaceline spacemacs-theme haskell-mode company org-bullets markdown-mode ranger neotree eyebrowse helm which-key flycheck smartparens evil-mc evil-surround super-save evil-magit magit evil-leader evil use-package)))
 '(proof-three-window-enable t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
