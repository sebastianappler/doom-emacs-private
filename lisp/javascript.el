;;; lisp/javascript.el -*- lexical-binding: t; -*-

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

;; .dir-locals.el example to make ts-ls work with yarn pnp
;; You need to run `yarn dlx @yarnpkg/sdks bas` to generate the .yarn/sdks folder
;; ((typescript-tsx-mode . ((eval . (let ((project-directory(car (dir-locals-find-file default-directory))))
;;                (setq lsp-clients-typescript-server-args
;;                      `("--tsserver-path" ,(concat project-directory ".yarn/sdks/typescript/bin/tsserver") "--stdio")))))))
