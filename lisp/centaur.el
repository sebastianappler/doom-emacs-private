(use-package! centaur-tabs
  :defer t
  :bind
  ("C-c t s" . centaur-tabs-counsel-switch-group)
  ("C-c t w" . centaur-tabs--kill-this-buffer-dont-ask)
  ("C-c t a" . centaur-tabs-kill-all-buffers-in-current-group)
  ("C-c t o" . centaur-tabs-kill-other-buffers-in-current-group)
  ("C-c t k" . centaur-tabs-forward)
  ("C-c t j" . centaur-tabs-backward)
  ("C-c t >" . centaur-tabs-move-current-tab-to-right)
  ("C-c t <" . centaur-tabs-move-current-tab-to-left)
  ("C-c t 0" . centaur-tabs-select-beg-tab)
  ("C-c t $" . centaur-tabs-select-end-tab)
)
