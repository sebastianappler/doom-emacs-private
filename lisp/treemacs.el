;; Treemacs
(use-package! treemacs
  :defer t
  :config
    (setq
      treemacs-indentation                      1
      treemacs-width                            32
      treemacs-workspace-switch-cleanup         'all
    )
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
  :bind
  (:map global-map
     ("M-0"             .       treemacs-select-window)
     ("C-c C-w s"       .       treemacs-switch-workspace)))

(add-hook! counsel-bookmark
  (treemacs-display-current-project-exclusively))

(defun treemacs-expand-when-first-used (&optional visibility)
  (when (or (null visibility) (eq visibility 'none))
    (treemacs-do-for-button-state
     :on-root-node-closed (treemacs-toggle-node)
     :no-error t)
    ))

(add-hook! 'treemacs-select-functions #'treemacs-expand-when-first-used)
(add-hook! 'treemacs-select-functions #'hide-mode-line-mode)
(add-hook! 'treemacs-switch-workspace-hook #'treemacs-expand-when-first-used)
