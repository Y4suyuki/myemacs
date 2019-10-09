;; auto insert closing bracket
(electric-pair-mode 1)

(global-hl-line-mode 1)

;; http://ergoemacs.org/emacs/organize_your_dot_emacs.html
(defun xah-get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path))

(when (display-graphic-p)
  (load (xah-get-fullpath "./app-ui-settings")))
(load (xah-get-fullpath "./hooks"))
(load (xah-get-fullpath "./beacon"))
(load (xah-get-fullpath "./all-the-icons"))
(load (xah-get-fullpath "./dired-mode"))
(load (xah-get-fullpath "./ivy-mode"))
(load (xah-get-fullpath "./rainbow-delimiters"))
(load (xah-get-fullpath "./paren"))
(load (xah-get-fullpath "./org-mode"))
(load (xah-get-fullpath "./yasnippet"))
(load (xah-get-fullpath "./dashboard"))
(load (xah-get-fullpath "./doom-modeline"))
(load (xah-get-fullpath "./magit"))
(load (xah-get-fullpath "./neotree"))
(load (xah-get-fullpath "./nyan-mode"))
