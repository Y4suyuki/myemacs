(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-redo)  ;; this only works for emacs 28 and above
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>fs") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'major-mode-hydra)
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (evil-define-key 'normal lsp-bridge-mode-map (kbd "g d") 'lsp-bridge-find-def)
  (evil-define-key 'normal lsp-bridge-mode-map (kbd "R") 'lsp-bridge-find-references)
  ;; set keybind to allow select next acm candidate with C-n
  (evil-define-key 'insert 'global (kbd "C-n") 'acm-select-next)
  (evil-define-key 'insert 'global (kbd "C-p") 'acm-select-prev)
  (evil-define-key 'normal 'global (kbd "<leader>l f") 'lsp-bridge-code-format)
  (evil-define-key 'normal 'global (kbd "<leader>l r") 'lsp-bridge-rename)
  (evil-define-key 'normal 'global (kbd "<leader>l a") 'lsp-bridge-code-action)
  (evil-define-key 'normal 'global (kbd "<leader>l TAB") 'lsp-bridge-indent-right))


(use-package evil-escape
  :ensure t
  :hook
  (evil-mode . evil-escape-mode)
  :config
  (setq-default evil-escape-key-sequence "jj")
  (setq-default evil-escape-delay 0.2))
