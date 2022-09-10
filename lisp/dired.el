;;; lisp/dired.el -*- lexical-binding: t; -*-

(map!
 :leader ;; SPC
 (:prefix-map ("o" . "open")
 :desc "Dired with preview"      "v"    #'dirvish
 :desc "Project sidebar"         "p"    #'dirvish-side))


(use-package! dirvish
  :defer t
  :init (after! dired (dirvish-override-dired-mode))
  :general (dired-mode-map "C-c C-r" #'dirvish-yank) ; for backward compatibility
  :after-call dired-noselect
  :config
  (set-popup-rule! "^ ?\\*Dirvish.*" :ignore t)
  (setq dirvish-cache-dir (concat doom-cache-dir "dirvish/")
        dirvish-attributes '(vc-state file-size all-the-icons collapse subtree-state)
        dirvish-mode-line-format
        '(:left (sort file-time symlink) :right (omit yank index))
        dired-listing-switches
        "-l --almost-all --human-readable --time-style=long-iso --group-directories-first --no-group"
        )

  (map! :map dirvish-mode-map
        :n "q"    #'dirvish-quit
        :n "?"    #'dirvish-dispatch
        :n "M-t"  #'dirvish-layout-toggle
        :n "a"    #'dirvish-quick-access
        :n "f"    #'dirvish-file-info-menu
        :n "y"    #'dirvish-yank-menu
        :n "s"    #'dirvish-quicksort
        :n "TAB"  #'dirvish-subtree-toggle
        :n "M-f"  #'dirvish-history-go-forward
        :n "M-b"  #'dirvish-history-go-backward
        :n "M-n"  #'dirvish-narrow
        :n "M-m"  #'dirvish-mark-menu
        :n "M-s"  #'dirvish-setup-menu
        :n "M-e"  #'dirvish-emerge-menu))
