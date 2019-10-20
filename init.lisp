(in-package :stumpwm)

(defvar init-directory 
  (directory-namestring 
    (truename (merge-pathnames (user-homedir-pathname)
                               ".stumpwmrc"))))

(defun ren/load-file (name)
  "Load a config file"
  (load  (merge-pathnames init-directory (concat name ".lisp"))))


(ren/load-file "util")
(ren/load-file "old")

