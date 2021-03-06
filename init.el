;-----------------------------------------------------------------------
; .emacs: The Emacs initialization file.
; Emacs executes this file whenever it is launched.
;-----------------------------------------------------------------------

; Bind the "Control-x n" key sequence to the function "linum",
; thus toggling line numbering.
(setq load-path (cons "~/.emacs.d/plugins" load-path))
(require 'linum)
(global-set-key "\C-xn" 'linum)

; Turn on syntax highlighting.
(global-font-lock-mode t)
;(setq font-lock-maximum-decoration t)

; Display the column number in the status bar.
(setq column-number-mode t)

; Highlight the region bounded by the mark and the point.
(setq transient-mark-mode t)

; Highlight matching parentheses, braces, and brackets.
(show-paren-mode t)

; Set the "Control-x l" (the letter "ell") key sequence to
; call the function "goto-line".
(global-set-key "\C-xl" 'goto-line)

; Set the Home and End keys as appropriate for PuTTY.
(global-set-key "\C-[[1~" 'beginning-of-line)
(global-set-key "\C-[[4~" 'end-of-line)

; Set the Home and End keys as appropriate for the Linux GNOME Terminal.
(global-set-key "\C-[OH" 'beginning-of-line)
(global-set-key "\C-[OF" 'end-of-line)

; Set the comment character for asm-mode to '#'.
(setq asm-comment-char ?#)

; Indent using spaces instead of tabs in c-mode and asm-mode.
(defun my-c-mode-common-hook ()
   (setq indent-tabs-mode nil))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(defun my-asm-mode-common-hook ()
   (setq indent-tabs-mode nil))
(add-hook 'asm-mode-hook 'my-asm-mode-common-hook)

;NOT WORKING
; When using an X-Window System server, make the scroll bar appear
; on the right instead of on the left.
;(set-scroll-bar-mode `right)

; Make the Control-n and Control-p keys (and the down arrow and up
; arrow keys) scroll the current window one line at a time instead
; of one-half screen at a time.
(setq scroll-step 1)

; Set the indentation style for C code.
(setq c-default-style "ellemtel")
; (setq c-default-style "cc-mode")
; (setq c-default-style "gnu")
; (setq c-default-style "k&r")
; (setq c-default-style "bsd")
; (setq c-default-style "stroustrup")

; Set the "Control-x p" key sequence to call the function "indent-all".
; The "indent-all" function indents all lines of the C program in the 
; current buffer according to the selected indentation style.
(defun indent-all()
   (interactive)
   (save-excursion
      (let ()
         (goto-char (point-min))
         (while (< (point) (point-max))
            (c-indent-command)
            (next-line 1)))))
(global-set-key "\C-xp" 'indent-all)

;;;Loads python customization
;;;(autoload 'python-mode "my-python-setup.el" "" t)

; For R, Emacs Speaks Statistics
;(require 'ess-site)

;;;For pymacs
;;;loads a pymacs.el from the_virtual_env_root/pymacs
(setq virtual-env (getenv "VIRTUAL_ENV"))

(when (not (equal virtual-env 'nil))
      (setq load-path (append
                 (list (concat virtual-env "/pymacs" ))
                 load-path))
;;;      (setq ropemacs-enable-shortcuts nil)
      (setq ropemacs-global-prefix "C-c C-p")
      (require 'pymacs)
      (pymacs-load "ropemacs" "rope-")
      (setq ropemacs-enable-autoimport 't)
      )

;;; ERC
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;;; php-mode from:
;;; git@github.com:ejmr/php-mode.git
(add-to-list 'load-path "~/.emacs.d/php-mode/")
(require 'php-mode)

;;; coffee-mode from:
;;; git@github.com:defunkt/coffee-mode.git
(add-to-list 'load-path "~/.emacs.d/coffee-mode/")
(require 'coffee-mode)

;;; flymake-easy from 
;;; git@github.com:purcell/flymake-easy.git
(add-to-list 'load-path "~/.emacs.d/flymake-easy/")
(require 'flymake-easy)

;;; flymake-php from
;;; git@github.com:purcell/flymake-php.git
(add-to-list 'load-path "~/.emacs.d/flymake-php/")
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;;; enable flymake when possible
(add-hook 'find-file-hook 'flymake-find-file-hook)

;;;add color theme from git@github.com:sellout/emacs-color-theme-solarized.git
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
;;;(load-theme 'solarized-light t)
(load-theme 'solarized-dark t)

;;;scala mode stuffs
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;;;ido mode
(require 'ido)
(ido-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
