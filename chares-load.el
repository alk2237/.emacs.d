;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(defvar rodos:home
  (expand-file-name (directory-file-name (getenv "HOME"))))
(defvar rodos:emacs-d
  (expand-file-name ".emacs.d" (file-name-as-directory rodos:home)))
(defvar rodos:share
  (expand-file-name "share" (file-name-as-directory "/usr")))
(defvar rodos:local
  (expand-file-name "local" (file-name-as-directory "/usr")))
(defvar rodos:emacs-a
  (expand-file-name "emacs" (file-name-as-directory rodos:share)))
(defvar rodos:emacs-b
  (expand-file-name "emacs/26.3" (file-name-as-directory rodos:share)))
(defvar rodos:emacs-c
  (expand-file-name "share/emacs" (file-name-as-directory rodos:local)))
(defvar rodos:benchmark
  (expand-file-name "benchmark" (file-name-as-directory rodos:emacs-d)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(defun rodos:add-path (my-path)
  "Add a path to load-path."
  (if (file-accessible-directory-p my-path)
      (setq load-path (cons my-path load-path))))

(defun rodos:add-subpaths (my-path)
  "Add a path and all subpaths to load-path."
  (if (file-accessible-directory-p my-path)
      (let ((default-directory my-path))
	(normal-top-level-add-subdirs-to-load-path))))

(defun rodos:push-path (my-path)
  "Push a path to load-path head."
  (if (file-accessible-directory-p my-path)
      (push my-path load-path)))

(defun rodos:push-site-lisp (my-path)
  (rodos:push-path
   (expand-file-name "site-lisp" my-path)))

(defun rodos:push-lisp (my-path)
  (rodos:push-path
   (expand-file-name "lisp" my-path)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(defun update-load-path (&rest _)
  "Force site-lisp and lisp to head of `load-path'."
  (rodos:push-site-lisp (file-name-as-directory rodos:emacs-a))
  (rodos:push-site-lisp (file-name-as-directory rodos:emacs-b))
  (rodos:push-site-lisp (file-name-as-directory rodos:emacs-c))
  (rodos:push-lisp (file-name-as-directory rodos:emacs-a))
  (rodos:push-lisp (file-name-as-directory rodos:emacs-b))
  (rodos:push-lisp (file-name-as-directory rodos:emacs-c)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(require 'benchmark-init
         (expand-file-name "benchmark-init.el"
                           (file-name-as-directory rodos:benchmark)))
(benchmark-init/activate)
(require 'benchmark-init-modes
         (expand-file-name "benchmark-init-modes.el"
                           (file-name-as-directory rodos:benchmark)))
(add-hook 'after-init-hook 'benchmark-init/deactivate)
(add-hook 'after-init-hook 'benchmark-init/show-durations-tabulated)
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(advice-add #'package-initialize :after #'update-load-path)
(update-load-path)
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(defvar load-directory-loaded nil
  "The files loaded by load-directory.")

(defvar load-directory-bytes 0
  "The number of bytes loaded by load-directory.")

(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath))
	(setq load-directory-loaded
	      (cons (file-name-sans-extension fullpath)
		    load-directory-loaded))
	(setq load-directory-bytes
	      (+ load-directory-bytes
		 (file-attribute-size (file-attributes fullpath))))))))
  (message (format-message "Loaded: %d from %s" load-directory-bytes directory)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(load-directory
 (expand-file-name "lisp" (file-name-as-directory rodos:emacs-d)))
(load-directory
 (expand-file-name "plugins/yasnippet" (file-name-as-directory rodos:emacs-d)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
