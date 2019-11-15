(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/mp/" "~/gh/" "~/lab/"))
  (setq projectile-git-submodule-command nil)
  (setq projectile-switch-project-action #'projectile-find-dir)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-sort-order 'modification-time)
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))
