;;; lisp/kubernetes.el -*- lexical-binding: t; -*-

(use-package! kubernetes
  :ensure t
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600))

(use-package! kubernetes-evil
  :ensure t
  :after kubernetes)

(evil-set-initial-state 'kubernetes-mode 'insert)
