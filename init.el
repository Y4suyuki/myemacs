;; init.el --- My Emacs configuration

(add-to-list 'default-frame-alist '(font . "Hack Nerd Font-12"))
(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("Noto Sans CJK JP"))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq exec-path (append exec-path
                        (list "/usr/local/bin" "$HOME/.cargo/bin")))

;; MACOS settings
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))


(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-default nil)


(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq create-lockfiles nil)
(setq css-indent-offset 2)

; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(defun alpha ()
  "set emacs alpha"
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
  (add-to-list 'default-frame-alist '(alpha . (85 . 50))))

(defun omega ()
  "set emacs alpha"
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(100 . 50))
  (add-to-list 'default-frame-alist '(alpha . (100 . 50))))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
)

(global-set-key "\C-cz" 'show-file-name)

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

(use-package jsonnet-mode
  :ensure t)

(use-package tree-sitter
  :ensure t
  :hook ((after-init . global-tree-sitter-mode)))

(use-package tree-sitter-langs
  :ensure t)

(use-package emojify
  :ensure t
  :hook ((after-init . global-emojify-mode)
         (after-init . emojify-mode-line-mode)))

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

(load (xah-get-fullpath "./transparency"))
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
(load (xah-get-fullpath "./rust-mode"))
(load (xah-get-fullpath "./hydra"))
;;(load (xah-get-fullpath "./mmm-mode"))
(load (xah-get-fullpath "./rg"))
