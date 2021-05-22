(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :bind(:map company-active-map
             ("C-n" . 'company-select-next)
             ("C-p" . 'company-select-previous)))
