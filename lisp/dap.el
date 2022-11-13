;;; lisp/dap.el -*- lexical-binding: t; -*-

(after! dap-mode
  (setq dap-auto-configure-features '(locals tooltip)))
