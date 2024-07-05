(use-package ruby-mode
  :mode "\\.rb\\'"
  :init
  (setq exec-path (append '("~/.rbenv/shims")
                          exec-path))
  (setq ruby-insert-encoding-magic-comment nil)
  :hook ((tree-sitter-after-on-hook . tree-sitter-hl-mode))
  :config
  (message "ruby-mode is loaded: %s" (current-time-string)))
