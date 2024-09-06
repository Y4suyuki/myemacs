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

(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))
