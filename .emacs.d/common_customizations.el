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

;; Turn touchpad off when using emacs
;; This depends on ~/bin/touchpad_id.sh to work properly

(defconst XINPUT-TOUCHPAD-ID (shell-command-to-string "~/bin/touchpad_id.sh"))
(defconst XINPUT-DISABLE-TOUCHPAD (concat "xinput --disable " XINPUT-TOUCHPAD-ID))
(defconst XINPUT-ENABLE-TOUCHPAD  (concat "xinput --enable " XINPUT-TOUCHPAD-ID))
(defconst SYNCLIENT-DISABLE-TOUCHPAD "synclient TouchpadOff=1")
(defconst SYNCLIENT-ENABLE-TOUCHPAD  "synclient TouchpadOff=0")

(defconst DISABLE-TOUCHPAD XINPUT-DISABLE-TOUCHPAD)
(defconst ENABLE-TOUCHPAD  XINPUT-ENABLE-TOUCHPAD)

(defun touchpad-off (&optional frame)
  (interactive)
  (shell-command DISABLE-TOUCHPAD))

(defun touchpad-on (&optional frame)
  (interactive)
  (shell-command ENABLE-TOUCHPAD))

(add-hook 'focus-in-hook #'touchpad-off)
(add-hook 'focus-out-hook #'touchpad-on)
(add-hook 'delete-frame-functions #'touchpad-on)
(add-hook 'kill-emacs-hook #'touchpad-on)


;;; common_customizations ends here
