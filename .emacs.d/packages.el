;;; packages.el --- Emacs packages

;;; Commentary:
;; This includes all use-packages.

;;; Code:

;;---------------------------Built-in Packages----------------------------------

(use-package paren
  :config
  (show-paren-mode +1))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-separator "/")
  ;; rename after killing uniquified
  (setq uniquify-after-kill-buffer-p t)
  ;; don't muck with special buffers
  (setq uniquify-ignore-buffers-re "^\\*"))

;; saveplace remembers your location in a file when saving files
(require 'saveplace)
(use-package saveplace
  :config
  (setq save-place-file (expand-file-name "saveplace" trucco-savefile-dir))
  ;; activate it for all buffers
  (setq-default save-place t))

(use-package savehist
  :config
  (setq savehist-additional-variables
        ;; search entries
        '(search-ring regexp-search-ring)
        ;; save every minute
        savehist-autosave-interval 60
        ;; keep the home clean
        savehist-file (expand-file-name "savehist" trucco-savefile-dir))
  (savehist-mode +1))

(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name "recentf" trucco-savefile-dir)
        recentf-max-saved-items 500
        recentf-max-menu-items 15
        ;; disable recentf-cleanup on Emacs start, because it can cause
        ;; problems with remote files
        recentf-auto-cleanup 'never)
  (recentf-mode +1))

(use-package windmove
  :config
  ;; use shift + arrow keys to switch between visible buffers
  (windmove-default-keybindings))

(use-package dired
  :config
  ;; dired - reuse current buffer by pressing 'a'
  (put 'dired-find-alternate-file 'disabled nil)

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this dired buffer
  (setq dired-dwim-target t)

  ;; enable some really cool extensions like C-x C-j(dired-jump)
  (require 'dired-x))

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face tabs trailing)))


;;---------------------------Installed Packages---------------------------------
;;----------------------------General Packages----------------------------------

;; This work-around prevents evil mode from auto-completing
;; after pressing <ESC>
(setq evil-want-abbrev-expand-on-insert-exit nil)

(require 'evil)
(use-package evil
  :ensure t
  :config
  (evil-mode t)
  )

(use-package avy
  :ensure t
  :bind (("s-." . avy-goto-word-or-subword-1)
         ("s-," . avy-goto-char))
  :config
  (setq avy-background t))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "<SPC> g s") #'magit-status)
  (define-key evil-visual-state-map (kbd "<SPC> g s") #'magit-status)
  )

(use-package projectile
  :ensure t
  :bind ("s-p" . projectile-command-map)
  :config
  (setq projectile-mode 'helm)
  (projectile-mode +1))

(use-package anzu
  :ensure t
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode))

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package move-text
  :ensure t
  :bind
  (([(meta shift up)] . move-text-up)
   ([(meta shift down)] . move-text-down)))

(use-package rainbow-delimiters
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

(use-package markdown-mode
  :ensure t)

(use-package org
  :ensure t
  :config
  (setq org-src-fontify-natively t) ;; Highlight code blocks in org-mode
  (setq org-link-frame-setup
        (quote ((vm . vm-visit-folder-other-frame)
                (vm-imap . vm-visit-imap-folder-other-frame)
                (gnus . org-gnus-no-new-news)
                (file . find-file) ;; Open file in the same frame and window :)
                (wl . wl-other-frame))))
  (setq org-log-done 'time)
  (setq org-todo-keywords
    '((sequence "TODO" "DOING" "DONE")))
  (setq org-agenda-span 30)  ;; look 30 days into the future
  (setq org-agenda-start-on-weekday nil)  ;; Start agenda view from today
  (define-key global-map (kbd "C-c a") 'org-agenda)
  )

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )


(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package super-save
  :ensure t
  :config
  (setq super-save-auto-save-when-idle t)
  (super-save-mode +1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode +1))

(use-package undo-tree
  :ensure t
  :config
  ;; autosave the undo-tree history
  (setq undo-tree-history-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq undo-tree-auto-save-history t))

(require 'evil-leader)
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key "b" 'switch-to-buffer "w" 'save-buffer))

(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (put 'dired-find-alternate-file 'disabled nil)
  (helm-mode 1)
  (define-key evil-normal-state-map (kbd "<SPC> <SPC>") #'helm-M-x)
  (define-key evil-visual-state-map (kbd "<SPC> <SPC>") #'helm-M-x)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  )

(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t)
  (define-key evil-normal-state-map (kbd "<SPC> f t") #'neotree-toggle)
  (define-key evil-visual-state-map (kbd "<SPC> f t") #'neotree-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "<SPC> f t") 'neotree-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-change-root)
  (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-hidden-file-toggle))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1)
  (define-key evil-visual-state-map (kbd "s") #'evil-surround-region)
  )

(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode  1) ;; enable
  )

(use-package ranger
  :ensure t
  :config
  (global-set-key (kbd "C-x d")
                  '(lambda ()
                     "Hide neotree before opening ranger"
                     (interactive) (neotree-hide) (ranger)))
  )

(use-package smartparens
  :ensure t
  :config
  (smartparens-mode 1)
  )

(use-package evil-smartparens
  :ensure t
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  )

(use-package eyebrowse
  :ensure t
  :config
  (defun eyebrowse-goto-configuration-workspace ()
  "Switch to workspace 0, open package configuration file and go to last line."
    (interactive)
    (eyebrowse-switch-to-window-config-0)
    (find-file "~/.emacs.d/packages.el")
    (evil-goto-line)
    (evil-previous-line 2))
  (progn
    (define-key eyebrowse-mode-map (kbd "M-0")
      'eyebrowse-goto-configuration-workspace)

    (define-key eyebrowse-mode-map (kbd "M-1")
      'eyebrowse-switch-to-window-config-1)

    (define-key eyebrowse-mode-map (kbd "M-2")
      'eyebrowse-switch-to-window-config-2)

    (define-key eyebrowse-mode-map (kbd "M-3")
      'eyebrowse-switch-to-window-config-3)

    (define-key eyebrowse-mode-map (kbd "M-4")
      'eyebrowse-switch-to-window-config-4)

    (define-key eyebrowse-mode-map (kbd "M-5")
      'eyebrowse-switch-to-window-config-5)

    (eyebrowse-mode t)
    (setq eyebrowse-new-workspace t))
  )

(use-package haskell-mode
  :ensure t)

;; Proof general. In order to install it (if not installed) issue the
;; following command:
;; git clone https://github.com/ProofGeneral/PG ~/.emacs.d/lisp/PG
;; cd ~/.emacs.d/lisp/PG; make
;;
;; or run the install_all.sh script:
;; ~/.emacs.d/install_all.sh

(load "~/.emacs.d/lisp/PG/generic/proof-site")

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-dark t))

(use-package spaceline
  :ensure t
  :demand t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (setq spaceline-buffer-size-p nil)
  (setq spaceline-minor-modes-p nil))

;;; packages.el ends here
