;; Org mode setting

(use-package org
  :bind
  ("\C-c l" . 'org-store-link)
  ("\C-c a" . 'org-agenda)
  ("\C-c c" . 'org-capture)
  :config
  (setq org-agenda-files '("~/org"))
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
        '(("t" "✔ Todo" entry (file+headline "~/org/gtd.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j" "✍ Journal" entry (file+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("n" "✎ Notes" entry (file+datetree "~/org/notes.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("m" "✎ Meeting" entry (file+datetree "~/org/meeting-notes.org")
           "* %?\nEntered on %U\n  %i\n  %a")))
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
        '(("skunkworks-ui" . "https://github.com/smn-ailab/skunkworks-ui/issues/"))))


(use-package org-bullets
  :ensure t
  :custom (org-bullets-bullet-list '("♞" "❶" "❷" "❸" "❹" "❺" "❻" "❼"))
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
