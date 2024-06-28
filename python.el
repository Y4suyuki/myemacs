(use-package python
  :init
  (setq exec-path (append '("~/.asdf/bin" "~/.asdf/shims")
                          exec-path)))

 (use-package lsp-pyright
   :ensure t
   :hook
   (python-mode . (lambda ()
                    (require 'lsp-pyright)
                    (lsp-deferred))))  ; or lsp-deferred

(use-package python-black
  :ensure t
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))
