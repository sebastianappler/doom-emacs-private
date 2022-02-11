;;; lisp/dired.el -*- lexical-binding: t; -*-

(use-package! dired-quick-sort
  :init
  (dired-quick-sort-setup))

(map!
  :map dired-mode-map
  :n "s" #'hydra-dired-quick-sort/body)
