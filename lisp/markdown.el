;;; lisp/markdown.el -*- lexical-binding: t; -*-

;; Enable syntax highlightning in code blocks
(setq markdown-fontify-code-blocks-natively t)

(custom-set-faces!
  `(markdown-header-face-1 (t (:foreground ,(doom-color 'level1))))
  `(markdown-header-face-2 (t (:foreground ,(doom-color 'level2))))
  `(markdown-header-face-3 (t (:foreground ,(doom-color 'level3))))
  `(markdown-header-face-4 (t (:foreground ,(doom-color 'level4))))
  `(markdown-header-delimiter-face (t (:foreground ,(doom-color 'comments))))
  `(markdown-link-face (t (:foreground ,(doom-color 'orange))))
  `(markdown-url-face (t (:foreground ,(doom-color 'comments))))
  )

(defun enable-auto-fill-edit ()
    (auto-fill-mode 1)
    (display-fill-column-indicator-mode 1))

(add-hook! 'gfm-mode-hook 'enable-auto-fill-edit)
