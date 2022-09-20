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

(use-package! sharper
  :defer t
  :config
  (setq sharper-nuget-search-URL "https://azuresearch-usnc.nuget.org/query?q=%s&prerelease=false&semVerLevel=2.0.0&take=250")

  (defun sharper--get-project-file (dir)
    "Get csproj file path from directory."
    (when dir
      (let ((files (directory-files dir t "\\.csproj")))
        (car files))))

  (defun sharper--get-target-advice-add-target (dotnet-target)
    "Advice to get target from nearest project if empty."
    (if (bound-and-true-p dotnet-target)
        (dotnet-target)
      (sharper--get-project-file (sharper--nearest-project-dir))))

  (defun sharper--nuget-search-advice-set-project (orig-fun &optional project-path)
    "Advice nuget search to use path from nearest project if empty."
    (unless (bound-and-true-p project-path)
      (let (proj-dir proj-file)
        (setq proj-dir (sharper--nearest-project-dir))
        (setq proj-file (sharper--get-project-file proj-dir))
      (funcall orig-fun proj-file))))

  (advice-add 'sharper--get-target :filter-return #'sharper--get-target-advice-add-target)
  (advice-add 'sharper--nuget-search :around #'sharper--nuget-search-advice-set-project))


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
;;                 "ASPNETCORE_URLS": "https://localhost:7239;http://localhost:5299"
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
