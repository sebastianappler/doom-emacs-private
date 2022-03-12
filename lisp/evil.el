(map!
 :n
 "<f12>"      #'evil-goto-definition
 :nv
 "s"          #'evil-ace-jump-char-mode)


;; Avoids annoying behaviour where pressing "q" and ":" in
;; sequence opens a Command Line window that will block your
;; commands as visual mode is default.
;; If you e.g. try yo close a window with "q" and then type
;; ":bd<RET>" you would have to type ":ibd<RET>" to enter
;; insert mode for the Command Line window
(evil-set-initial-state 'evil-command-window-mode 'insert)

(use-package! evil-owl
  :config
  (define-key! evil-owl-mode-map [remap evil-record-macro] 'nil)
  (define-key! evil-owl-mode-map [remap evil-set-marker] 'nil)
  (define-key! evil-owl-mode-map [remap evil-goto-mark] 'nil)
  (define-key! evil-owl-mode-map [remap evil-goto-mark-line] 'nil)
  (evil-owl-mode))
