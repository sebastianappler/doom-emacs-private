;;; lisp/corfu.el -*- lexical-binding: t; -*-

(use-package! corfu
  :hook
  (doom-first-buffer . global-corfu-mode)
  :config
  (setq corfu-auto t
        corfu-quit-no-match t
        corfu-preselect-first t))

(use-package corfu-doc
  :hook
  (corfu-mode . corfu-doc-mode)
  :bind (:map corfu-map
         ("M-n" . corfu-doc-scroll-down)
         ("M-p" . corfu-doc-scroll-up)
         ("M-d" . corfu-doc-toggle)))

(use-package orderless
  :init
  ;; Tune the global completion style settings to your liking!
  ;; This affects the minibuffer and non-lsp completion at point.
  (setq completion-styles '(orderless partial-completion basic)
        completion-category-defaults nil
        completion-category-overrides nil))

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

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))
