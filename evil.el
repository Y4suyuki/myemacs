(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-redo)  ;; this only works for emacs 28 and above
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (evil-define-key 'normal 'python-mode-map (kbd "R") 'lsp-find-references))
