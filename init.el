;; init.el --- My Emacs configuration

(add-to-list 'default-frame-alist '(font . "Hack Nerd Font-10"))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq exec-path (append exec-path
                        (list "/usr/local/bin")))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq create-lockfiles nil)
(setq css-indent-offset 2)

;; auto insert closing bracket
(electric-pair-mode 1)

(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :background "#271D30")

(set-locale-environment "en_US.UTF-8")

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; http://ergoemacs.org/emacs/organize_your_dot_emacs.html
(defun xah-get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path))

(when (display-graphic-p)
  (load (xah-get-fullpath "./app-ui-settings")))

(use-package markdown-mode
  :ensure t)

(use-package carbon-now-sh
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package fish-mode
  :ensure t)

(use-package tree-sitter
  :ensure t)

(use-package tree-sitter-langs
  :ensure t)

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

(use-package terraform-mode
  :ensure t)

(use-package terraform-doc
  :ensure t)

(use-package graphql-mode
  :ensure t)

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

(use-package prettier
  :ensure t
  :config
  (add-to-list 'safe-local-variable-values
               '(eval . (prettier-mode t))))

(load (xah-get-fullpath "./cursor"))
(load (xah-get-fullpath "./company"))
(load (xah-get-fullpath "./beacon"))
(load (xah-get-fullpath "./all-the-icons"))
(load (xah-get-fullpath "./dired-mode"))
(load (xah-get-fullpath "./projectile"))
(load (xah-get-fullpath "./ivy-mode"))
(load (xah-get-fullpath "./rainbow-delimiters"))
(load (xah-get-fullpath "./paren"))
(load (xah-get-fullpath "./org-mode"))
(load (xah-get-fullpath "./yasnippet"))
(load (xah-get-fullpath "./dashboard"))
(load (xah-get-fullpath "./doom-modeline"))
(load (xah-get-fullpath "./magit"))
(load (xah-get-fullpath "./treemacs.el"))
(load (xah-get-fullpath "./nyan-mode"))
(load (xah-get-fullpath "./highlight-indent-guides"))
(load (xah-get-fullpath "./flycheck"))
(load (xah-get-fullpath "./python"))
(load (xah-get-fullpath "./tide"))
(load (xah-get-fullpath "./web-mode"))
(load (xah-get-fullpath "./rjsx-mode"))
(load (xah-get-fullpath "./git-link"))
(load (xah-get-fullpath "./ruby-mode"))
(load (xah-get-fullpath "./lsp-mode"))
(load (xah-get-fullpath "./company"))
(load (xah-get-fullpath "./docker"))
(load (xah-get-fullpath "./go-mode"))
(load (xah-get-fullpath "./hydra"))
;;(load (xah-get-fullpath "./mmm-mode"))
(load (xah-get-fullpath "./rg"))
