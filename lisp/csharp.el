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
;; Template for dotnet project with dap-debug
;;
;; .vscode/launch.json
;; {
;;     "version": "0.2.0",
;;     "configurations": [
;;         {
;;             // Use IntelliSense to find out which attributes exist for C# debugging
;;             // Use hover for the description of the existing attributes
;;             // For further information visit https://github.com/OmniSharp/omnisharp-vscode/blob/master/debugger-launchjson.md
;;             "name": ".NET Core Launch (web)",
;;             "mode": "launch",
;;             "type": "coreclr",
;;             "request": "launch",
;;             "preLaunchTask": "build",
;;             // If you have changed target frameworks, make sure to update the program path.
;;             "program": "${workspaceFolder}/bin/Debug/net6.0/testapi.dll",
;;             "args": [],
;;             "cwd": "${workspaceFolder}",
;;             "stopAtEntry": false,
;;             // Enable launching a web browser when ASP.NET Core starts. For more information: https://aka.ms/VSCode-CS-LaunchJson-WebBrowser
;;             "serverReadyAction": {
;;                 "action": "openExternally",
;;                 "pattern": "\\bNow listening on:\\s+(https?://\\S+)"
;;             },
;;             "env": {
;;                 "ASPNETCORE_ENVIRONMENT": "Development",
;;                 "ASPNETCORE_URLS": "http://*:5050"
;;             },
;;             "sourceFileMap": {
;;                 "/Views": "${workspaceFolder}/Views"
;;             },
;;             "dap-compilation": "dotnet build ${workspaceFolder}/testapi.csproj"
;;         },
;;         {
;;             "name": ".NET Core Attach",
;;             "type": "coreclr",
;;             "request": "attach"
;;         }
;;     ]
;; }
