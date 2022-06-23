;;; lisp/atomic-chrome.el -*- lexical-binding: t; -*-

;; Prerequisites: https://github.com/fregante/GhostText

(setq atomic-chrome-default-major-mode 'markdown-mode
      atomic-chrome-buffer-open-style 'full)

(atomic-chrome-start-server)
