;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Emacs Python Customization attempt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.3.1/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete-1.3.1/dict")
(ac-config-default)

;;Use only spaces and no tabs, for python development
;;(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
;;(setq default-tab-width 4)

;;;Pymacs
(add-to-list 'load-path "~/.emacs.d/pymacs/")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")



;;needed to avoid key-binding confusion
(setq ropemacs-global-prefix "C-c r")
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
;;end of loading when it's a python file


(add-to-list 'load-path
                  "~/.emacs.d/vendor/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet-0.6.1c/snippets")


;;flymake cursor el
(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))
(load-library "flymake-cursor")
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)

;;django stuff
(load "~/.emacs.d/vendor/nxml-mode-20041004/rng-auto.el")
(load "~/.emacs.d/vendor/nxhtml/autostart.el")
(setq mumamo-background-colors nil) 
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
