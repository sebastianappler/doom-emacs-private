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

;;
;; Startup
(setq initial-frame-alist
      (append '((width . 140))
                initial-frame-alist))

(add-to-list 'initial-frame-alist '(fullscreen . fullheight))
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
