(use-package python
  :ensure t
  :init
  (setq exec-path (append '("~/.asdf/bin" "~/.asdf/shims")
                          exec-path)))

(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function
        #'pipenv-projectile-after-switch-extended))

