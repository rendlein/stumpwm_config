(in-package :stumpwm)

(define-key *root-map* (kbd "c")    "ren/run-terminal")
(define-key *root-map* (kbd "C-w")  "ren/run-browser")
(define-key *root-map* (kbd "Q")    "quit")
(define-key *root-map* (kbd "M-r")  "reinit")
(define-key *root-map* (Kbd "M-R")  "soft-restart")
(define-key *root-map* (kbd "b")    "mode-line")
(define-key *root-map* (kbd "C-p")  "dmenu")
(define-key *root-map* (kbd "M-S")  "screen-blank")

(defcommand prison () ()
            (run-shell-command "sh steam steam://rungameid/233450" nil))

(defvar *steam-map* 
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "p") "prison")
    m))

(defvar *programming-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "i") "intellij-idea")
    (define-key m (kbd "p") "pycharm")
    m))

(define-key *root-map* (kbd "M-s") '*steam-map*)
(define-key *root-map* (kbd "M-P") '*programming-map*)
(define-key *top-map*  (kbd "M-T") "touch_toggle")


(defcommand dmenu () () 
            (run-shell-command "dmenu_run -l 3 -g 3"))
(defcommand reinit () ()
            (run-commands "reload" "loadrc"))

(defcommand soft-restart () ()
            (run-commands "restart-soft"))

(defcommand screen-blank () ()
            (run-shell-command "sleep 2; xset dpms force off"))

(defcommand intellij-idea () ()
            (run-shell-command "idea"))

(defcommand pycharm () ()
            (run-shell-command "pycharm"))

(defcommand touch_toggle () ()
            (run-shell-command "touchpad_toggle"))
