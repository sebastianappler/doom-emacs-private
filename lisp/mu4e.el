;;; lisp/mu4e.el -*- lexical-binding: t; -*-

(use-package! mu4e
  :defer t
  :config
  (set-email-account! "protonmail.com"
                      '((mu4e-sent-folder       . "/protonmail.com/Sent Mail")
                        (mu4e-drafts-folder     . "/protonmail.com/Drafts")
                        (mu4e-trash-folder      . "/protonmail.com/Trash")
                        (mu4e-refile-folder     . "/protonmail.com/All Mail")
                        (mu4e-compose-signature . "\n/Sebastian"))
                      t)

  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-auth-credentials "~/.authinfo.gpg"
        smtpmail-smtp-server "127.0.0.1"
        smtpmail-stream-type 'starttls
        smtpmail-smtp-service 1025
        smtpmail-debug t)

  (setq mu4e-maildir-shortcuts
        '((:maildir "/protonmail.com/INBOX"      :key  ?i)
          (:maildir "/protonmail.com/All Mail"   :key  ?a)
          (:maildir "/protonmail.com/Sent Mail"  :key  ?s))))
