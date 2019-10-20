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

(ren/load-file "util")
(ren/load-file "keys")
(ren/load-file "groups")

(run-shell-command "feh --bg-scale /home/rendlein/.wallpapers/748350.png")
