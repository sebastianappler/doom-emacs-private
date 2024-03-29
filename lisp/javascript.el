;;; lisp/javascript.el -*- lexical-binding: t; -*-

(custom-set-faces!
  `(web-mode-html-tag-face (t (:foreground ,(doom-color 'type))))
  `(web-mode-function-name-face (t (:foreground ,(doom-color 'functions))))
  `(web-mode-function-call-face (t (:foreground ,(doom-color 'functions)))))

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

;; Reduces lag when opening js[x]/ts[x] files
;; See https://github.com/doomemacs/doomemacs/issues/6878
(advice-add #'add-node-modules-path :override #'ignore)

;; .dir-locals.el example to make ts-ls work with yarn pnp
;; You need to run `yarn dlx @yarnpkg/sdks bas` to generate the .yarn/sdks folder
;; ((typescript-tsx-mode . ((eval . (let ((project-directory(car (dir-locals-find-file default-directory))))
;;                (setq lsp-clients-typescript-server-args
;;                      `("--tsserver-path" ,(concat project-directory ".yarn/sdks/typescript/bin/tsserver") "--stdio")))))))
