(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :init
  (setq exec-path (append exec-path
			  (list (concat (getenv "HOME") "/.asdf/bin")
				(concat (getenv "HOME") "/.asdf/shims"))))
  :hook ((typescript-mode . setup-tide-mode)
	 (typescript-mode . tide-hl-identifier-mode)))
