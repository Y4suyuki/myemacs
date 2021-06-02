(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs (append yas-snippet-dirs
                                 "~/emacs.d/snippets")))

(use-package yasnippet-snippets
  :ensure t)
