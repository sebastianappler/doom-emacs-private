;;; lisp/corfu.el -*- lexical-binding: t; -*-

(use-package! corfu
  :config
  (setq corfu-auto t
        corfu-quit-no-match t
        corfu-preselect-first t))

(use-package cape
  :defer t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-ispell)
  (add-to-list 'completion-at-point-functions #'cape-dict))

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!
  :init
  (defun appler/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))) ;; Configure orderless
  :hook
  (lsp-completion-mode . appler/lsp-mode-setup-completion))
