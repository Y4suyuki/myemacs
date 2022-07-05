(defun beacon-off ()
  "beacon mode off"
  (beacon-mode 0))

(use-package beacon
  :ensure t
  :hook (org-tree-slide-mode . beacon-off)
  :custom
  (beacon-color "#dfff00")
  :config
  (beacon-mode 1))
