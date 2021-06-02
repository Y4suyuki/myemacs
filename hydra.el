(use-package hydra
  :ensure t)

(defhydra hydra-zoom (global-map "s-g" :hint nil :color "blue")
  "
zoom
zoom
zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(defhydra hydra-org (org-mode-map "C-z")
  "Org-mode shortcut hydra keys"
  ("n" org-narrow-to-subtree)
  ("w" widen)
  ("e" org-export-dispatch))
