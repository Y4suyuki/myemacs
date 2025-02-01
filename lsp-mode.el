(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  (global-lsp-bridge-mode)
  :config
  (setq acm-enable-copilot t)
  (setq lsp-bridge-enable-auto-format-code t)
  (setq lsp-bridge-enable-hover-diagnostic t)
  (setq lsp-bridge-auto-format-code-idle 2)
  (setq lsp-bridge-user-langserver-dir "~/.emacs.d/lsp-langserver/"))

(use-package which-key
  :ensure t
  :config
  (message "loaded which-key: %s" (current-time-string))
  (which-key-mode))
