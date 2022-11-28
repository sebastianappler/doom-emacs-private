(map! :map org-mode-map
      "C-c C-w"  nil)

(setq org-directory "~/org/"
      org-directory-proj "~/org/projects"
      org-roam-directory (concat org-directory "notes/")
      org-roam-db-location (concat org-roam-directory ".org-roam.db")
      org-agenda-include-diary t
      org-time-stamp-formats '("[%Y-%m-%d %a %H:%M]")
      org-log-note-clock-out t)

(after! org
  (setq org-capture-templates
        (append
        '(("h" "Hugo post" entry (file+olp "./blog/posts.org" "Blog")
          (function appler/org-hugo-capture-template))
          ("P" "Add project" plain
          (file appler/org-project-generate-filename)
          "%(appler/org-project-capture-template)")
          ("T" "Add task" entry (file+olp buffer-name "Project" "Tasks" "Backlog")
          (function appler/org-project-add-task-template)))
        org-capture-templates))

  (defun appler/org-hugo-capture-template ()
    (let* ((title (read-from-minibuffer "Post Title: "))
           (filename (org-hugo-slug title)))
      (mapconcat #'identity `(
        ,(concat "* TODO " title)
        ":PROPERTIES:"
        ,(concat ":EXPORT_FILE_NAME: " filename)
        ,(concat ":EXPORT_DATE: " (format-time-string "%Y-%m-%d"))
        ":END:"
        "%?\n")
        "\n")))

  (defun appler/org-project-capture-template ()
    (let* ((name appler-org-project-name)
           (filename appler-org-project-filename))
      (mapconcat #'identity `(
        ,(concat "#+title: " name)
        ""
        ,"* Project"
        ":PROPERTIES:"
        ,(concat ":NAME: " name)
        ":CATEGORY: Project"
        ,(concat ":CREATED: " (format-time-string "[%Y-%m-%d %a %H:%M]"))
        ":END:"
        "** Description"
        "%?"
        "*** Goals"
        ""
        "** Tasks"
        "*** Backlog"
        "*** Active"
        "*** Closed"
        ""
        "** Outcome")
        "\n")))


  (defun appler/next-issue-number()
    (let ((proj-files
       (directory-files org-directory-proj t directory-files-no-dot-files-regexp)))
    (length (org-map-entries t "/+TODO\|STRT\|DONE" proj-files))))

  (defun appler/org-project-add-task-template ()
      (mapconcat #'identity `(
        ,"* TODO %?"
        ":PROPERTIES:"
        ,(concat ":CREATED: " (format-time-string "[%Y-%m-%d %a %H:%M]"))
        ,(concat ":CUSTOM_ID: " (number-to-string (appler/next-issue-number)))
        ":END:"
        "** Definition of done"
        "** Outcomde")
        "\n"))

  (defun appler/org-project-generate-filename ()
    (setq appler-org-project-name (read-from-minibuffer "Project name: "))
    (setq appler-org-project-filename (org-hugo-slug appler-org-project-name))
    (expand-file-name (format "%s.org" appler-org-project-filename) org-directory-proj)))
