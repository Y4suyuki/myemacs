(use-package hydra
  :ensure t)

(defhydra hydra-zoom (global-map "s-SPC" :hint nil :color "blue")
  "
g: increase scale
l: descrease scale
u: up trasparency
d: down transparency
"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out")
  ("u" transparency-up "transparency up")
  ("d" transparency-down "transparency down"))

(use-package major-mode-hydra
  :ensure t
  :bind
  ("M-SPC" . major-mode-hydra))

(major-mode-hydra-define org-mode nil
  ("Tree"
   (("n" org-narrow-to-subtree "narrow to subtree")
    ("w" widen "widen"))
   "Export"
   (("e" org-export-dispatch))
   "Image"
   (("t" org-toggle-inline-images))))

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

(major-mode-hydra-define dired-mode nil
  ("Deletion"
   (("d" dired-flag-file-deletion "flag delete")
    ("x" dired-do-flagged-delete "delete flagged files"))
   "Copy"
   (("C" dired-do-copy "copy"))))
