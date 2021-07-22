(use-package treemacs
  :ensure t
  :defer t
  :after (treemacs-all-the-icons)
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("C-x t t" . treemacs))
  :config
  (treemacs-load-theme "all-the-icons"))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-all-the-icons
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)
