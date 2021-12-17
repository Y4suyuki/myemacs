(use-package python
  :ensure t
  :init
  (setq exec-path (append '("~/.asdf/bin" "~/.asdf/shims")
                          exec-path)))

(use-package lsp-pyright
  :ensure t
  :init
  (setq lsp-pyright-venv-path "/Users/ageishi.yasuyuki/Library/Caches/pypoetry/virtualenvs/jira-count-py-CgAalG1x-py3.9")
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred
