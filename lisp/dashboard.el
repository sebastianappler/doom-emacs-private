;;; lisp/dashboard.el -*- lexical-binding: t; -*-

(use-package! dashboard
  :ensure t
  :config
  (setq dashboard-center-content t
        dashboard-items '((agenda   . 5)
                          ;; (recents  . 5)
                          ;; (projects . 5)
                          )
        dashboard-startup-banner (concat doom-user-dir "assets/doom-emacs-gray.png")
        dashboard-banner-logo-title nil
        dashboard-set-init-info nil
        dashboard-set-footer nil)

  ;; Shows org agenda on dashboard
  ;;
  (defun dashboard-get-agenda()
    "Get copy of org-agenda buffer."
    (save-window-excursion
      (org-agenda-list)
      (prog1 (buffer-string)
        (kill-buffer))))

  (defun dashboard-insert-agenda (&rest _)
    "Insert a copy of org-agenda buffer."
    (dashboard-insert-heading "Agenda for today:")
    (dolist (line (split-string (dashboard-get-agenda) "\n"))
      (insert "\n" line)))

  (dashboard-setup-startup-hook))
