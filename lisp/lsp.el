;; To avoid asking for restart when switching workspace in treemacs
(setq lsp-restart 'ignore
      lsp-enable-symbol-highlighting 1
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil
      +lsp-prompt-to-install-server 'quiet)

;; (add-hook! 'lsp-mode lsp-toggle-symbol-highlight)
