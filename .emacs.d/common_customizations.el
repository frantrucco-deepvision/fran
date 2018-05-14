;;; common_customizations.el --- Common configurations

;;; Commentary:
;; This file includes scrolling, line number, column, tab behavior
;; and other common customizations

;;; Code:

;; Nice scrolling
(setq scroll-margin 0
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)

;; Mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Emacs modes typically provide a standard means to change the
;; indentation width -- eg. c-basic-offset: use that to adjust your
;; personal indentation width, while maintaining the style (and
;; meaning) of any files you load.
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 4)            ;; but maintain correct appearance

;; Newline at end of file
(setq require-final-newline t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; highlight the current line
(global-hl-line-mode +1)

(custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Split vertically
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;; common_customizations ends here
