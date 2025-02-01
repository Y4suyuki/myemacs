;; init.el --- My Emacs configuration
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; fonts
(add-to-list 'default-frame-alist '(font . "Hack Nerd Font-12"))
(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("Noto Sans CJK JP"))

;; essential basics
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-default nil)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq create-lockfiles nil)
(setq css-indent-offset 2)
(set-locale-environment "en_US.UTF-8")
(prefer-coding-system 'utf-8)

;; app ui settings
(when (display-graphic-p)
  (progn
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))))

;; paths
(setq exec-path (append exec-path
                        (list "/usr/local/bin"
                              "~/.cargo/bin"
                              "~/go/bin")))

;; MACOS settings
(when (eq system-type 'darwin)
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin")))

;; commands
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

;; http://ergoemacs.org/emacs/organize_your_dot_emacs.html
(defun xah-get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path))


;; keymaps
(global-set-key "\C-cz" 'show-file-name)

;; auto insert closing bracket
(electric-pair-mode 1)

(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :background "#271D30")

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(use-package mozc
  :ensure t)

(use-package carbon-now-sh
  :ensure t
  :defer 30)

(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

(use-package fish-mode
  :ensure t
  :mode "\\.fish\\'")

(use-package jsonnet-mode
  :ensure t
  :mode "\\.jsonnet\\'")

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
  :ensure t
  :mode "\\.tf\\'")

(use-package terraform-doc
  :commands terraform-doc
  :ensure t)


(use-package graphql-mode
  :ensure t
  :defer 30)

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

(use-package prettier
  :ensure t
  :mode "\\.ts\\'"
  :config
  (add-to-list 'safe-local-variable-values
               '(eval . (prettier-mode t))))

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2))

(load (xah-get-fullpath "./transparency"))
(load (xah-get-fullpath "./cursor"))
;;(load (xah-get-fullpath "./company"))
(load (xah-get-fullpath "./beacon"))
(load (xah-get-fullpath "./all-the-icons"))
(load (xah-get-fullpath "./dired-mode"))
(load (xah-get-fullpath "./projectile"))
(load (xah-get-fullpath "./ivy-mode"))
(load (xah-get-fullpath "./rainbow-delimiters"))
(load (xah-get-fullpath "./paren"))
(load (xah-get-fullpath "./org-mode"))
(load (xah-get-fullpath "./evil"))
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
(load (xah-get-fullpath "./docker"))
(load (xah-get-fullpath "./go-mode"))
(load (xah-get-fullpath "./rust-mode"))
(load (xah-get-fullpath "./hydra"))
;;(load (xah-get-fullpath "./mmm-mode"))
(load (xah-get-fullpath "./rg"))
(load (xah-get-fullpath "./ai"))
