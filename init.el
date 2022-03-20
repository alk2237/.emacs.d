;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== PRE-INIT ===== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(setq stack-trace-on-error t)
(setq debug-on-error t)
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== PACKAGE-ARCHIVES == ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize) (unless (package-installed-p 'use-package)
  (package-refresh-contents) (package-install 'use-package))
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== LOAD-FILES === ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(load (expand-file-name "chares-load" user-emacs-directory))
(load (expand-file-name "chares-global" user-emacs-directory))
(load (expand-file-name "chares-prog-mode" user-emacs-directory))
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== TRAMP === ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(setq tramp-default-method "ssh")
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== STARTUP-BUFFERS === ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(find-file (expand-file-name "init.el" user-emacs-directory))
(find-file (expand-file-name "chares-load.el" user-emacs-directory))
(find-file (expand-file-name "chares-global.el" user-emacs-directory))
(find-file (expand-file-name "chares-prog-mode.el" user-emacs-directory))
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== REMOTE-STARTUP-BUFFERS = ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(find-file "/home/chares/gdrive/sync-files/todo.org")
(find-file "/home/chares/.config/i3/config") ;; i3wm config ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== CUSTOM-SET-VARIABLES === ==== ==== ==== ==== ==== ==== ==== == ;;
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org use-package irony-eldoc compiler-explorer ac-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
