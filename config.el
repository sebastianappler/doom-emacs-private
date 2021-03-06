;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Sebastian Appler"
      user-mail-address "sebastian.appler@protonmail.com"

      treemacs-width 32
      display-line-numbers-type nil
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil
      )

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; FIXME Fix for emacs 27
;; https://github.com/emacs-lsp/lsp-mode/issues/1778
;; (setq lsp-gopls-codelens nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;(add-hook 'after-init-hook' treemacs-select-window)

;;
;;;; Packages
(use-package! treemacs-all-the-icons)

(use-package! treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

;; Treemacs
(use-package! treemacs
  :init
    (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
  :config
  (progn
    (
      setq treemacs-indentation          1
    )
   ;; (treemacs-git-mode -1)
  )
  :bind
  (:map global-map
     ("M-0"     . treemacs-select-window)))


(defun treemacs-expand-when-first-used (&optional visibility)
  (when (or (null visibility) (eq visibility 'none))
    (treemacs-do-for-button-state
     :on-root-node-closed (treemacs-toggle-node)
     :no-error t)))

(add-hook! 'treemacs-select-functions #'treemacs-expand-when-first-used)
(add-hook! 'treemacs-switch-workspace-hook #'treemacs-expand-when-first-used)

;; Centaur tabs
(use-package! centaur-tabs
  :bind
  ("C-c t s" . centaur-tabs-counsel-switch-group)
  ("C-c t w" . centaur-tabs--kill-this-buffer-dont-ask)
  ("C-c t k" . centaur-tabs-kill-all-buffers-in-current-group)
  ("C-c t o" . centaur-tabs-kill-other-buffers-in-current-group)
  ("C-c t k" . centaur-tabs-forward)
  ("C-c t j" . centaur-tabs-backward)
  ("C-c t >" . centaur-tabs-move-current-tab-to-right)
  ("C-c t <" . centaur-tabs-move-current-tab-to-left)
  ("C-c t 0" . centaur-tabs-select-beg-tab)
  ("C-c t $" . centaur-tabs-select-end-tab)
)

;; ox-hugo
(use-package! ox-hugo
  :ensure t
  :after ox)

;;
;;; UI

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;;
;;;; Templates
(with-eval-after-load 'org
  (setq org-capture-templates '(
    ("h" "Hugo post" entry (file+olp "./blog/posts.org" "Blog")
    (function org-hugo-new-subtree-post-capture-template))))
)

(with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    (let* ((title (read-from-minibuffer "Post Title: "))
    (fname (org-hugo-slug title)))
      (mapconcat #'identity `(
        ,(concat "* TODO " title)
        ":PROPERTIES:"
        ,(concat ":EXPORT_FILE_NAME: " fname)
        ,(concat ":EXPORT_DATE: " (format-time-string "%Y-%m-%d"))
        ;;":EXPORT_DESCRIPTION: "
        ;;":EXPORT_HUGO_CUSTOM_FRONT_MATTER: "
        ":END:"
        "%?\n")
        "\n"))
    )
)

;;
;; Startup
;; Doom initialize ui changes very late in the startup process
;; To make sure they are loaded append logic using either doom-load-theme-hook or doom-after-init-modules-hook
;; Reference https://github.com/hlissner/doom-emacs/blob/develop/core/core-ui.el#L664-L665
(add-hook! 'doom-load-theme-hook :append
  (treemacs-load-theme "all-the-icons")
  (message "Loaded all-the-icons treemacs theme!")
  (doom/quickload-session)
  (treemacs))
