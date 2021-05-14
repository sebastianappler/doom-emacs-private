(map! :map org-mode-map
      "C-c C-w"  nil)

(setq org-directory "~/org/"
      org-roam-directory (concat org-directory "notes/")
      org-roam-db-location (concat org-roam-directory ".org-roam.db"))

;;
;; Ox hugo
(after! org
  (setq org-capture-templates
        (append
        '(("h" "Hugo post" entry (file+olp "./blog/posts.org" "Blog")
           (function org-hugo-new-subtree-post-capture-template)))
        org-capture-templates)
  )
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
