;;; lisp/verb.el -*- lexical-binding: t; -*-

(after! org
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map))
