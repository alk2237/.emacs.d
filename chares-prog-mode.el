;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(defvar rodos:headers
  '("/usr/include/c++/9"
    "/usr/lib/gcc/x86_64-linux-gnu/9"
    "/usr/include"))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(global-set-key (kbd "<f5>")
                (lambda () (interactive)
                  (setq-local compilation-read-command nil)
                  (call-interactively 'compile)))
(add-hook 'emacs-lisp-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)
            (setq display-line-numbers-mode 1)
            (setq column-number-mode 1)
            (setq show-paren-mode 1)
            (eldoc-mode 1)))
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)
            (setq display-line-numbers-mode 1)
            (setq column-number-mode 1)
            (setq show-paren-mode 1)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (setq ac-quick-help-delay 0.4)
            (setq ac-candidate-limit 4)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(require 'ac-c-headers)
(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)
            (define-key c-mode-map [(tab)] 'auto-complete)
            (auto-complete-mode 1)))
(add-hook 'c++-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)
            (define-key c++-mode-map [(tab)] 'auto-complete)
            (auto-complete-mode 1)))
;; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ;;
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(defun my-irony-mode-hook ()
  (lambda ()
    (eldoc-mode 1)))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'c++-mode-hook 'irony-eldoc)
(add-hook 'c-mode-hook 'irony-eldoc)
;; ==== == C/C++ PROGRAMMING === ==== ==== ==== ==== ==== ==== ;;
(load (expand-file-name "my-c-style" user-emacs-directory))
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "chares")
             (setq electric-mode nil)))
