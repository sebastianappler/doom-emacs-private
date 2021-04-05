;;; lisp/irc.el -*- lexical-binding: t; -*-

(after! circe
  (set-irc-server! "chat.freenode.net"
                   `(:tls t
                     :port 6697
                     :nick "sappler"
                     :sasl-username ,(+pass-get-user "irc/freenode")
                     :sasl-password (lambda (&rest _) (+pass-get-secret "irc/freenode"))
                     :channels ("#emacs"))))
