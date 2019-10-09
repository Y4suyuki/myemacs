(use-package dashboard
  :ensure t
  :custom
  (dashboard-startup-banner 4)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t))
