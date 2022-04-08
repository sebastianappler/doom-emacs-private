;;; lisp/dired.el -*- lexical-binding: t; -*-

;; (use-package! dired
;;   :commands dired-jump
;;   :config
;;   (progn (add-hook! 'dired-mode-hook 'dired-hide-details-mode)))

(use-package! dired-quick-sort
  :init
  (dired-quick-sort-setup))

(map!
  :map dired-mode-map
  :n "S" #'hydra-dired-quick-sort/body)
