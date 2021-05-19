;;; lisp/irc.el -*- lexical-binding: t; -*-

(after! circe
  (set-irc-server! "irc.libera.chat"
                   `(:tls t
                     :port 6697
                     :nick "sappler"
                     :sasl-username ,(+pass-get-user "irc/libera.chat")
                     :sasl-password (lambda (&rest _) (+pass-get-secret "irc/libera.chat"))
                     :channels ("#emacs")
                     )))
