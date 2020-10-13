(in-package :stumpwm)

(defvar init-directory 
  (directory-namestring 
    (truename (merge-pathnames (user-homedir-pathname)
                               ".stumpwmrc"))))

(defun ren/load-file (name)
  "Load a config file"
  (load  (merge-pathnames init-directory (concat name ".lisp"))))

(setf *mode-line-border-width* 0)

;;; Set the cursor to be an actual cursor instead of an X
(run-shell-command "xsetroot -cursor_name left_ptr")
(run-shell-command "feh --bg-scale /home/rendlein/.wallpapers/*.jpg")

;(load-module "ttf-fonts")
;(set-font (make-instance 'xft:font :family "Droid Sans Mono" :subfamily "Regular" :size 6))

;;; Load the other parts of the configuration
(ren/load-file "util")
(ren/load-file "keys")
(ren/load-file "groups")

