(use-package dashboard
  :ensure t
  :custom
  (dashboard-startup-banner 4)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((recents . 10)
			  (bookmarks . 5)
			  (agenda . 5))))
