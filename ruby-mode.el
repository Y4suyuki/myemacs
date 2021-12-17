(use-package ruby-mode
  :init
  (setq exec-path (append '("~/.rbenv/shims")
                          exec-path))
  (setq ruby-insert-encoding-magic-comment nil)
  :hook ((tree-sitter-after-on-hook . tree-sitter-hl-mode)))
