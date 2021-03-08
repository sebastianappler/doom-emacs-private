;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Sebastian Appler"
      user-mail-address "sebastian.appler@protonmail.com"

      display-line-numbers-type nil
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil
      )

;;
;;; UI

(setq doom-theme 'doom-dracula)
(setq org-directory "~/org/")
(setq display-line-numbers-type t)

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;;
;; Custom config

(load! "lisp/windows")
(load! "lisp/treemacs")
(load! "lisp/centaur")
(load! "lisp/templates")
(load! "lisp/ox-hugo")

;;
;; Startup

;; Doom initialize ui changes very late in the startup process
;; To make sure they are loaded append logic using either doom-load-theme-hook or doom-after-init-modules-hook
;; Reference https://github.com/hlissner/doom-emacs/blob/develop/core/core-ui.el#L664-L665
(add-hook! 'doom-load-theme-hook :append
  (treemacs-load-theme "all-the-icons")
  (message "Loaded all-the-icons treemacs theme!")
  (doom/quickload-session)
  (treemacs)
  )


