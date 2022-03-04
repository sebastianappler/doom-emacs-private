;;; lisp/javascript.el -*- lexical-binding: t; -*-


(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)
