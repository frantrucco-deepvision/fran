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
