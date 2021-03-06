(in-package :stumpwm)

(export 
  '(*ren/terminals*
     *ren/browswers*))

(defun shell-command (command)
  (check-type command string)
  (echo-string (current-screen) (run-shell-command commant t)))

(defvar *wallpapers* "/home/rendlein/.wallpapers")
(defun random-background ()
  (let ((file-list (directory (concat *wallpapers* "*.*")))
       (*random-state* (make-random-state t)))
    (namestring (nth (random ( length file-list)) file-list))))


;;; Found in alezost's stumpwm config. Changed to fit my applications and prefix.
;;; github.com/alezost/stumpwm-config
(defun ren/executable? (name)
  (zerop
    (nth-value 2
               (uiop:run-program
                 (concat "command -v " name)
                 :force-shell t
                 :ignore-error-status t))))

(defvar *ren/browsers* 
  '(("brave" . "Brave-browser")
    ("chromium" . "Chromium")
    ("firefox" . "firefox")))

(defvar *ren/current-browser*
  nil)

(defun ren/current-browser ()
  (or *ren/current-browser*
      (setf *ren/current-browser*
            (or (find-if (lambda (assoc)
                           (ren/executable? (car assoc)))
                         *ren/browsers*)
                (progn
                  (echo "No browser found")
                  (car *ren/browsers*))))))

(defcommand ren/run-browser (&optional args) (:rest)
            (let ((browser (ren/current-browser)))
              (if args
                  (progn
                    (run-shell-command (concat (car browser) " " args))
                    (ren/run-browser))
                  (run-or-raise (car browser) `(:class ,(cdr browser))))))

(defvar *ren/terminals*
  '(("st -e ~/.bin/tm" . "st-256color")
    ("xterm" . "XTerm")))

(defvar *ren/current-terminal*
  nil)

(defun ren/current-terminal ()
  (or *ren/current-terminal*
      (setf *ren/current-terminal*
            (or (find-if (lambda (assoc)
                           (ren/executable? (car assoc)))
                         *ren/terminals*)
                (progn
                  (echo "No terminal found")
                  (car *ren/terminals*))))))

(defcommand ren/run-terminal (&optional args) (:rest)
            (let ((term (ren/current-terminal)))
              (if args
                  (progn
                    (run-shell-command (concat (car term) " " args))
                    (ren/run-terminal))
                  (run-or-raise (car term) `(:class ,(cdr term))))))


