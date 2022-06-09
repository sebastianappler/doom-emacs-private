;;; lisp/kubernetes.el -*- lexical-binding: t; -*-

(use-package! kubernetes
  :defer t
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-default-overview-view 'pods)
  (set-popup-rules!
    '(("^\\*kubernetes*" :ignore t))))

(use-package! kubernetes-evil
  :after (kubernetes-overview))

(map!
   :after kubernetes-evil
   :map kubernetes-mode-map
   :m "n"       #'kubernetes-set-namespace
   :m "C-j"     #'magit-section-forward
   :m "C-k"     #'magit-section-backward
   :m "]"       #'magit-section-forward-sibling
   :m "["       #'magit-section-backward-sibling)
