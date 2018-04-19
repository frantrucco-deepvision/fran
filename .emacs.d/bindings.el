;;; bindings.el --- custom bindings configuration file

;;; Commentary:
;; Global bindings not related to specific packages (bindings that
;; cannot be included inside a use-package).

;;; Code:

;; replace buffer-menu with ibuffer
(define-key evil-normal-state-map (kbd "<SPC> b") #'switch-to-buffer)

;;; bindings.el ends here
