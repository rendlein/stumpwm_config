(in-package :stumpwm)
;;; Groups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Workspaces
(run-commands "gnewbg Web" "gnewbg Misc")

(clear-window-placement-rules)
(grename "Dev")

(define-frame-preference "Dev"
    (0 t t :class "st-256color"))

(define-frame-preference "Web"
    (0 t t :class "Chromium")
    (0 t t :class "firefox"))

(define-frame-preference "Misc"
    (0 t t :class "Steam"))

