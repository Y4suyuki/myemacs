;; web-mode settings
;; http://web-mode.org

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package web-mode
  :ensure t
  :after (flycheck)
  :mode ("\\.\\(ts\\|tsx\\|html\\)$" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  :hook ((web-mode . (lambda ()
                       (when (string-equal "tsx" (file-name-extension buffer-file-name))
                         (setup-tide-mode))
                       (when (string-equal "ts" (file-name-extension buffer-file-name))
                         (setup-tide-mode)))))
  :config
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "#6ccff5")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#fdc8f0")
  (set-face-attribute 'web-mode-html-attr-custom-face nil :foreground "#fdb8f0")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#fdb8f0")
  (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#9888a0")
  (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#4ff3ce")
  (set-face-attribute 'web-mode-json-string-face nil :foreground "#4ff3ce")
  (set-face-attribute 'web-mode-javascript-string-face nil :foreground "#4ff3ce"))
