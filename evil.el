(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>fs") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'major-mode-hydra)
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (evil-define-key 'normal 'python-mode-map (kbd "R") 'lsp-find-references))
