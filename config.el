;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Sebastian Appler"
      user-mail-address "sebastian.appler@protonmail.com"

      doom-theme 'doom-dracula
      doom-themes-treemacs-theme "doom-colors"
      +lsp-prompt-to-install-server 'quiet
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil)

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;;
;; Custom config
(load! "lisp/bash")
(load! "lisp/centaur")
(load! "lisp/evil")
(load! "lisp/gdb")
(load! "lisp/irc")
(load! "lisp/lsp")
(load! "lisp/org")
(load! "lisp/treemacs")
(load! "lisp/windows")
;;
;; Startup
(setq initial-frame-alist
        (append '((width . 137) (height . 100) (top . 0) (left . 0))
                initial-frame-alist))
