;; Org mode setting

(defun my/set-org-face-attributes ()
  "set org mode face attributes"
  (progn
    (setq mode-line-format nil)
    (setq buffer-face-mode-face '(:family "Playfair Display" :height 180))
    (buffer-face-mode)
    (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Noto Serif JP" :weight 'normal))
    (dolist (face '((org-level-1 . 1.5)
                    (org-level-2 . 1.3)
                    (org-level-3 . 1.2)
                    (org-level-4 . 1.1)
                    (org-level-5 . 1.1)
                    (org-level-6 . 1.1)
                    (org-level-7 . 1.1)
                    (org-level-8 . 1.1)
                    (org-document-title . 2.0)
                    (org-verbatim . 1.0)))
      (set-face-attribute (car face) nil :font "Playfair Display" :weight 'semi-bold :height (cdr face)))
    (custom-theme-set-faces
     'user
     '(org-block ((t (:inherit fixed-pitch :height .6))))
     '(org-code ((t (:inherit (shadow fixed-pitch) :height .6))))
     '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
     '(org-table ((t (:inherit (org-hide fixed-pitch) :height .6))))
     '(org-block-begin-line ((t (:inherit (org-hide fixed-pitch) :height .6)))))))

(use-package org
  :bind
  ("\C-c l" . 'org-store-link)
  ("\C-c a" . 'org-agenda)
  ("\C-c c" . 'org-capture)
  :hook
  (org-mode . my/set-org-face-attributes)
  (org-mode . org-indent-mode)
  (org-mode . visual-line-mode)
  :config
  (setq left-margin-width 2)
  (setq right-margin-width 2)
  (setq org-startup-with-inline-images t)
  (setq org-agenda-files '("~/s3-fs/org"))
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
        '(("t" "✔ Todo" entry (file+headline "~/s3-fs/org/gtd.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j" "✍ Journal" entry (file+datetree "~/s3-fs/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("n" "✎ Notes" entry (file+datetree "~/s3-fs/org/notes.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("m" "✎ Meeting" entry (file+datetree "~/s3-fs/org/meeting-notes.org")
           "* %?\nEntered on %U\n  %i\n  %a")))
  (setq org-todo-keywords
        '((sequence "TODO" "REVIEW" "|" "DONE" "DELEGATED" "ARCHIVED")))
  (setq org-tag-alist '(("1on1" . ?o)
                        ("meeting" . ?m)
                        ("setup" . ?s)
                        ("issue" . ?i)
                        ("book" . ?b)
                        ("project" . ?p)))
  (setq org-agenda-current-time-string "← now")
  (setq org-agenda-time-grid
        '((daily today require-timed)
          (0900 01000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400)
          "-"
          "────────────────"))
  (setq org-link-abbrev-alist
        '(("skunkworks-ui" . "https://github.com/smn-ailab/skunkworks-ui/issues/")))
  ;; beautify org mode
  (setq org-hide-emphasis-markers t)
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (font-lock-add-keywords 'org-mode
                          '((" +\\([*]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "✱"))))))
  (org-babel-do-load-languages
   'org-babel-load-languages '((emacs-lisp . t)
                               (python . t)
                               (plantuml . t)
                               (mermaid . t)))
  (add-to-list 'org-src-lang-modes '("napkin-puml" . plantuml)))

(use-package org-bullets
  :ensure t
  ;; 1 pawn = 1 point.
  ;; 1 Knight = 3 points.
  ;; 1 Bishop = 3 points.
  ;; 1 Rook = 5 points.
  ;; 1 Queen = 9 points.
  :custom (org-bullets-bullet-list '("♚" "♛" "♜" "♝" "♞" "♟" "♟" "♟"))
  :hook (org-mode . org-bullets-mode))

(use-package ox-gfm
  :ensure t
  :after org)

(use-package ox-hugo
  :ensure t
  :after ox)

(use-package org-pomodoro
  :ensure t
  :config
  (setq org-pomodoro-format "🍅 %s"))

(use-package ob-napkin
  :ensure t)

(use-package plantuml-mode
  :ensure t)

(use-package ob-mermaid
  :ensure t)

(use-package org-tree-slide
  :ensure t
  :custom
  (org-image-actual-width nil))
