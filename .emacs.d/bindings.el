;;; bindings.el --- custom bindings configuration file

;;; Commentary:
;; Global bindings not related to specific packages (bindings that
;; cannot be included inside a use-package).

;;; Code:

(define-key evil-normal-state-map (kbd "<SPC> b b") #'switch-to-buffer)
(define-key evil-normal-state-map (kbd "<SPC> b d") #'kill-this-buffer)

;;; bindings.el ends here
