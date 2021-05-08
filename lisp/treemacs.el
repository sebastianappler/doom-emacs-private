(use-package! treemacs-all-the-icons)

(use-package! treemacs-icons-dired
  :after treemacs dired
  :config (treemacs-icons-dired-mode))

;; Treemacs
(use-package! treemacs
  :init
    (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
  :config
  (progn
    (setq
      treemacs-indentation                      1
      treemacs-width                            32
      treemacs-workspace-switch-cleanup         'all
    )
   ;; (treemacs-git-mode -1)
  )
  :bind
  (:map global-map
     ("M-0"             .       treemacs-select-window)
     ("C-c C-w s"             .       treemacs-switch-workspace)
     ))

(add-hook! counsel-bookmark
  (treemacs-display-current-project-exclusively))

(defun treemacs-expand-when-first-used (&optional visibility)
  (when (or (null visibility) (eq visibility 'none))
    (treemacs-do-for-button-state
     :on-root-node-closed (treemacs-toggle-node)
     :no-error t)
    ))

(add-hook! 'treemacs-select-functions #'treemacs-expand-when-first-used)
(add-hook! 'treemacs-switch-workspace-hook #'treemacs-expand-when-first-used)
(add-hook! 'treemacs-switch-workspace-hook #'treemacs-select-window)
