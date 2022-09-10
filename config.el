;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;
;; General config

(setq user-full-name "Sebastian Appler"
      user-mail-address "sebastian.appler@protonmail.com")

;; Smooth scrolling
;;(pixel-scroll-precision-mode)

;; A sacrifice to exclude company-dabbrev and company-yasnippet in text-mode to
;; get proper completion with company-ispell. If it's used with a grouped
;; backend it will complete everything lowercased i.e. if you start a new word
;; with captial letter it will rewrite the completion lowercased so you will
;; need to go back and fix the casing.
;;
;; See issue: https://github.com/company-mode/company-mode/issues/1096
(set-company-backend! 'text-mode 'company-ispell)

;; Show fill column indicator in text-mode
;;(add-hook! 'text-mode-hook (display-fill-column-indicator-mode 1))

;;
;; UI
(setq doom-font (font-spec :family "JetBrainsMono" :size 15 :weight 'regular)
      doom-theme 'doom-dracula
      doom-themes-treemacs-theme "doom-colors")

(setq fancy-splash-image (concat doom-user-dir "assets/doom-emacs-gray.png"))
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)

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
;; Module Config

;;(load! "lisp/atomic-chrome")
(load! "lisp/bash")
(load! "lisp/calendar/sv-kalender")
(load! "lisp/csharp")
;;(load! "lisp/dashboard")
(load! "lisp/dired")
(load! "lisp/evil")
(load! "lisp/gdb")
(load! "lisp/irc")
(load! "lisp/javascript")
(load! "lisp/kubernetes")
(load! "lisp/lsp")
(load! "lisp/markdown")
(load! "lisp/org")
(load! "lisp/windows")

;;
;; Startup

(when (display-graphic-p)
  (with-eval-after-load "moom"
    (moom-mode 1))

  (moom-fill-left))
