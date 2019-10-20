(in-package :stumpwm)
;;(set-font "-*-droid-medium-r-*-*-18-*-*-*-*-*-*-")
(setf *mode-line-border-width* 0)
;;(setf *mode-line-timeout* 1)

;;; Variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Games
(defvar *oni* 457140)

;;; Application Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcommand dmenu () ()
            (run-shell-command "dmenu_run"))
(defcommand reinit () ()
            (run-commands "reload" "loadrc"))
(defcommand screen-blank () ()
            (run-shell-command "xset dpms force off"))

;;; Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings
(define-key *root-map* (kbd "c") 	"ren/run-terminal")
(define-key *root-map* (kbd "C-w")  "ren/run-browser")
(define-key *root-map* (kbd "Q") 	"quit")
(define-key *root-map* (kbd "M-r") 	"reinit")
(define-key *root-map* (kbd "b") 	"mode-line")
(define-key *root-map* (kbd "C-p")  "dmenu")
(define-key *root-map* (kbd "M-S")  "screen-blank")

;;; Groups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Workspaces
(run-commands "gnewbg Web" "gnewbg Docs" "gnewbg Misc" "gnewbg Dev")

(clear-window-placement-rules)

(define-frame-preference "Default"
    (0 t t :class "st-256color"))

(define-frame-preference "Web"
    (0 t t :class "Chromium" :instance "chromium")
    (0 t t :class "firefox"))

(define-frame-preference "Docs")

(define-frame-preference "Misc"
    (0 t t :class "Steam" :instance "Steam"))

(define-frame-preference "Dev")

;;; Run at startups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(run-shell-command (cat "feh --bg-scale " (random-background)))
(run-shell-command "xsetroot -cursor_name left_ptr")

;; vim: set ft=lisp : ;;
