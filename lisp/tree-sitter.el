;;; lisp/treesitter.el -*- lexical-binding: t; -*-

(use-package! tree-sitter
  :defer t
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  ;; Activate tree-sitter for typescript, but the highlight gets weird colors
  ;; (tree-sitter-require 'tsx)
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-mode . tsx))
  ;; (setq tree-sitter-hl-use-font-lock-keywords nil)
  )
