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

;; Set initial frame size at current monitor top left
;; with fullheight and half width
(defun set-initial-frame ()
  (let* ((base-factor 0.557)
    (a-width (/ (* (display-pixel-width) base-factor) 2))
        (a-height (display-pixel-height))
        (a-left (truncate (/ (- (display-pixel-width) a-width) 2)))
    (a-top (truncate (display-pixel-height))))
    (set-frame-position (selected-frame) a-left a-top)
    (set-frame-size (selected-frame) (truncate a-width)  (truncate a-height) t)))
(setq frame-resize-pixelwise t)
(set-initial-frame)

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
