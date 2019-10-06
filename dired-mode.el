(defun my-dired-mode-setup()
  (dired-hide-details-mode 1))

(add-hook 'dired-mode-hook 'my-dired-mode-setup)
