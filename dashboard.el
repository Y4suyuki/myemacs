(use-package dashboard
  :ensure t
  :custom
  (dashboard-startup-banner 1)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq show-week-agenda-p t)
  (setq dashboard-items '((projects . 10)
                          (recents . 10)
                          (bookmarks . 5)
                          (agenda . 5))))
