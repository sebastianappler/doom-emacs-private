;;; lisp/rust.el -*- lexical-binding: t; -*-

(after! dap-mode
  ;;(require 'dap-cpptools)
  (require 'dap-gdb-lldb)
  (setq dap-auto-configure-features '(sessions locals tooltip))
  (dap-register-debug-template "Rust::GDB Run Configuration"
                               (list :type "gdb"
                                     :request "launch"
                                     :name "GDB::Run"
                                     :gdbpath "rust-gdb"
                                     :target "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
                                     :cwd nil
                                     :dap-compilation "cargo build"
                                     :dap-compilation-dir "${workspaceFolder}"
                                     ))

 (dap-register-debug-template "Rust::CppTools Run Configuration"
                                 (list :type "cppdbg"
                                       :request "launch"
                                       :name "Rust::Run"
                                       :MIMode "gdb"
                                       :miDebuggerPath "rust-gdb"
                                       :environment []
                                       :program "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
                                       :cwd "${workspaceFolder}"
                                       :console "external"
                                       :dap-compilation "cargo build"
                                       :dap-compilation-dir "${workspaceFolder}"))

  (add-hook! 'dap-terminated-hook (dap-delete-all-sessions))
  (add-hook! 'dap-stopped-hook (run-at-time "200 milliseconds" nil #'dap-ui-locals)))
