;;; lisp/kubernetes.el -*- lexical-binding: t; -*-

(use-package! kubernetes
  :defer t
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-default-overview-view 'pods)
  (set-popup-rules!
    '(("^\\*kubernetes overview" :ignore t))))

(use-package! kubernetes-evil
  :defer t
  :after (kubernetes-overview)
  :config
  (map!
   :map kubernetes-mode-map
   :m "n"       #'kubernetes-set-namespace
   :m "C-j"     #'magit-section-forward
   :m "C-k"     #'magit-section-backward
   :m "]"       #'magit-section-forward-sibling
   :m "["       #'magit-section-backward-sibling))
