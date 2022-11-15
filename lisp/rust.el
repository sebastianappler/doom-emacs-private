;;; lisp/rust.el -*- lexical-binding: t; -*-

(after! dap-mode
  (require 'dap-gdb-lldb)
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

  (add-hook! 'dap-terminated-hook (dap-delete-all-sessions))
  (add-hook! 'dap-stopped-hook (run-at-time "200 milliseconds" nil #'dap-ui-locals)))
