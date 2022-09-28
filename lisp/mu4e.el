;;; lisp/mu4e.el -*- lexical-binding: t; -*-

(use-package! mu4e
  :defer t
  :config
  (set-email-account! "mail.com"
                      '((mu4e-sent-folder       . "/mail.com/Sent Mail")
                        (mu4e-drafts-folder     . "/mail.com/Drafts")
                        (mu4e-trash-folder      . "/mail.com/Trash")
                        (mu4e-refile-folder     . "/mail.com/All Mail")
                        (smtpmail-smtp-user     . "user@mail.com")
                        (mu4e-compose-signature . "---\nBest regards"))
                      t)
  (setq mu4e-maildir-shortcuts
        '((:maildir "/mail.com/INBOX"     :key  ?i)
          (:maildir "/mail.com/All Mail"  :key  ?a))))
