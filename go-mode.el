(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook (before-save . gofmt-before-save))

(use-package go-playground
  :ensure t
  :init
  (setq exec-path (append exec-path
                          (list "/usr/local/bin")))
  :config
  (setq go-playground-init-command "go mod init playground"))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :custom
  (dap-auto-configure-feature '(sessions locals breakpoints expressions repl controls tooltip))
  :config
  (dap-mode 1)
  (dap-auto-configure-mode 1)
  (require 'dap-hydra)
  (require 'dap-go))

(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))
