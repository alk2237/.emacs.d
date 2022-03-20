;; ======= ==== ECHO-KEYSTROKES === ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(setq echo-keystrokes 0.5)
;; == ==== ==== DEFAULT-FONT = ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(set-face-attribute 'default nil :font "SF Mono Bold 18")
;; == ==== ==== MOVE-LINES === ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(require 'move-lines)
(move-lines-binding)
;; == ==== ==== WHOLE-LINE-OR-REGION === ==== ==== ==== ==== ==== ==== ==== == ;;
(require 'whole-line-or-region)
(whole-line-or-region-global-mode t)
;; == ==== ==== SHOW-TRAILING-WHITESPACE ==== ==== ==== ==== ==== ==== ==== == ;;
(setq-default show-trailing-whitespace nil)
(defun toggle-show-trailing-whitespace ()
  (interactive) (callf null show-trailing-whitespace))
;; == ==== ==== LINE-NUMBERS-MODE = ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(display-line-numbers-mode 1)
(defun toggle-line-numbers-mode ()
  (interactive) (callf null display-line-numbers-mode))
;; == ==== ==== COLUMN-NUMBER-MODE  ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(column-number-mode 1)
(defun toggle-column-number-mode ()
  (interactive) (callf null column-number-mode))
;; == ==== ==== SHOW-PAREN-MODE === ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(show-paren-mode 1)
(defun toggle-show-paren-mode ()
  (interactive) (callf null show-paren-mode))
;; == ==== ==== SCROLL == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 2)
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)
(setq auto-window-vscroll nil)
;; == ==== ==== LOAD-THEME === ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
(require 'zenburn-theme)
(load-theme 'zenburn t)
;; == ==== ==== FRAME-PARAMETERS == ==== ==== ==== ==== ==== ==== ==== ==== == ;;
;;(set-frame-parameter (selected-frame) 'alpha 72 72))
;;(add-to-list 'default-frame-alist '(alpha 73 72))
;; == ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== == ;;
