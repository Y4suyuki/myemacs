(use-package all-the-icons)
(use-package all-the-icons-dired
             :ensure t)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
