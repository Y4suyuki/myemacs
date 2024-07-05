(use-package magit
  :ensure t
  :commands magit-status
  :bind
  ("C-x g" . 'magit-status)
  ("C-x M-g" . 'magit-dispatch))
