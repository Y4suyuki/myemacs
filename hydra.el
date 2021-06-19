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

(use-package major-mode-hydra
  :ensure t
  :bind
  ("M-SPC" . major-mode-hydra))

(major-mode-hydra-define org-mode nil
  ("Tree"
   (("n" org-narrow-to-subtree "narrow to subtree")
    ("w" widen "widen"))
   "Export"
   (("e" org-export-dispatch))))

(major-mode-hydra-define emacs-lisp-mode nil
  ("Eval"
   (("b" eval-buffer "buffer")
    ("e" eval-defun "defun")
    ("r" eval-region "region"))
   "REPL"
   (("I" ielm "ielm"))
   "Test"
   (("t" ert "prompt")
    ("T" (ert t) "all")
    ("F" (ert :failed) "failed"))
   "Doc"
   (("d" describe-foo-at-point "thing-at-pt")
    ("f" describe-function "function")
    ("v" describe-variable "variable")
    ("i" info-lookup-symbol "info lookup"))))
