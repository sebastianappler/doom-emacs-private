(use-package! lsp-mode
  :defer t
  :commands lsp
  :hook
  (sh-mode . lsp))
