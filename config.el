;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Sebastian Appler"
      user-mail-address "sebastian.appler@protonmail.com"

      doom-theme 'doom-dracula
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
;; Doom initialize ui changes very late in the startup process
;; To make sure they are loaded append logic using either doom-load-theme-hook or doom-after-init-modules-hook
;; Reference https://github.com/hlissner/doom-emacs/blob/develop/core/core-ui.el#L664-L665
(add-hook! 'doom-load-theme-hook :append
  (treemacs-load-theme "all-the-icons")
  (message "Loaded all-the-icons treemacs theme!"))
