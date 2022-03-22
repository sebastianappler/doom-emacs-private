;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;
;; Variables
(setq user-full-name "Sebastian Appler"
      user-mail-address "sebastian.appler@protonmail.com"

      doom-font (font-spec :family "JetBrainsMono" :size 15 :weight 'regular)
      doom-theme 'doom-dracula
      doom-themes-treemacs-theme "doom-colors"
      +lsp-prompt-to-install-server 'quiet
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil)

;;
;; Theme
(custom-set-faces!
  `(web-mode-html-tag-face (t (:foreground ,(doom-color 'type))))
  `(web-mode-function-name-face (t (:foreground ,(doom-color 'functions))))
  `(web-mode-function-call-face (t (:foreground ,(doom-color 'functions))))

  `(markdown-header-face-1 (t (:foreground ,(doom-color 'level1))))
  `(markdown-header-face-2 (t (:foreground ,(doom-color 'level2))))
  `(markdown-header-face-3 (t (:foreground ,(doom-color 'level3))))
  `(markdown-header-face-4 (t (:foreground ,(doom-color 'level4))))
  `(markdown-header-delimiter-face (t (:foreground ,(doom-color 'comments))))
  `(markdown-link-face (t (:foreground ,(doom-color 'orange))))
  `(markdown-url-face (t (:foreground ,(doom-color 'comments))))
  )

;;
;; Key Bindings
(map!
 :desc "Backward kill word"             "C-<backspace>"         'nv-delete-back-all
 :desc "Backward kill expression"       "C-S-<backspace>"       'backward-kill-sexp

 :leader ;; SPC
 :desc "Find file other window"         "C-SPC"                #'projectile-find-file-other-window)

;; Info-mode
(map!
  :map Info-mode-map
  :prefix "g"
  :n "l" #'Info-scroll-up
  :n "h" #'Info-scroll-down)

;;
;; Hacks
;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;;
;; Package Config
(load! "lisp/bash")
(load! "lisp/csharp")
(load! "lisp/dired")
(load! "lisp/evil")
(load! "lisp/gdb")
(load! "lisp/irc")
(load! "lisp/javascript")
(load! "lisp/kubernetes")
(load! "lisp/lsp")
(load! "lisp/org")
(load! "lisp/treesitter")
(load! "lisp/windows")

;;
;; Startup
(with-eval-after-load "moom"
  (moom-mode 1))

(moom-fill-left)
