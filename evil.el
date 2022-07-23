(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (evil-define-key 'normal 'python-mode-map (kbd "R") 'lsp-find-references))
