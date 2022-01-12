;;; lisp/kubernetes.el -*- lexical-binding: t; -*-

(use-package! kubernetes
  :commands (kubernetes-overview))

(use-package! kubernetes-evil
  :after (kubernetes-overview)
  :config
  (evil-define-key 'motion kubernetes-mode-map
    (kbd "q")    #'kill-this-buffer))
