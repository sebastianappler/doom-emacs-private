;;; lisp/kubernetes.el -*- lexical-binding: t; -*-

(use-package! kubernetes
  :commands (kubernetes-overview)
  :config
  (set-popup-rules!
    '(("^\\*kubernetes overview" :ignore t))))

(use-package! kubernetes-evil
  :after (kubernetes-overview)
  :config
  (map!
   :map kubernetes-mode-map
   :m "n"       #'kubernetes-set-namespace
   :m "C-j"     #'magit-section-forward
   :m "C-k"     #'magit-section-backward
   :m "]"       #'magit-section-forward-sibling
   :m "["       #'magit-section-backward-sibling))
