;;; lisp/csharp.el -*- lexical-binding: t; -*-

(add-to-list '+debugger--dap-alist
        '((:lang csharp +lsp)     :after csharp-mode :require dap-netcore) t)

(map!
 :map csharp-mode-map
 :n "<f5>"      #'dap-debug
 :n "S-<f5>"    #'dap-disconnect
 :n "<f9>"      #'dap-breakpoint-toggle
 :n "<f10>"     #'dap-continue
 :n "<f11>"     #'dap-step-in
 :n "S-<f11>"   #'dap-step-out
 )
