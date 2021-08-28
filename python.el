(use-package python
  :ensure t
  :init
  (setq exec-path (append '("~/.asdf/bin" "~/.asdf/shims")
                          exec-path)))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp))))
