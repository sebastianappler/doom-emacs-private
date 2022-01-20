;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Sebastian Appler"
      user-mail-address "sebastian.appler@protonmail.com"

      doom-font (font-spec :family "JetBrainsMono" :size 15 :weight 'regular)
      doom-theme 'doom-dracula
      doom-themes-treemacs-theme "doom-colors"
      +lsp-prompt-to-install-server 'quiet
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil)

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Info-mode
(map!
  :map Info-mode-map
  :prefix "g"
  :n "l" #'Info-scroll-up
  :n "h" #'Info-scroll-down)

;;
;; Startup
(with-eval-after-load "moom"
  (moom-mode 1))

(moom-fill-left)

;;
;; Custom config
(load! "lisp/bash")
;; (load! "lisp/centaur")
(load! "lisp/evil")
(load! "lisp/gdb")
(load! "lisp/irc")
(load! "lisp/kubernetes")
(load! "lisp/lsp")
(load! "lisp/org")
;; (load! "lisp/treemacs")
(load! "lisp/windows")
