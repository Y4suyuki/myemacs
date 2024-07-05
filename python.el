(use-package python
  :mode ("\\.py\\'" . python-mode)
  :init
  (setq exec-path (append '("~/.asdf/bin" "~/.asdf/shims")
                          exec-path)))

(use-package ruff-format
  :ensure t
  :after python
  :hook (python-mode . ruff-format-on-save-mode))

 (use-package lsp-pyright
   :ensure t
   :after python
   :hook
   (python-mode . (lambda ()
                    (require 'lsp-pyright)
                    (lsp-deferred))))  ; or lsp-deferred

(use-package python-black
  :ensure t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(use-package pyvenv
  :ensure t
  :after python
  :config
  (pyvenv-mode t)
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))
