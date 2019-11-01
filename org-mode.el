;; Org mode setting
(require 'org)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture
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

(setq org-agenda-files (list "~/org"))

(setq org-agenda-current-time-string "← now")
(setq org-agenda-time-grid
      '((daily today require-timed)
        (0900 01000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400)
        "-"
        "────────────────"))

(use-package org-bullets
  :custom (org-bullets-bullet-list '("♞" "❶" "❷" "❸" "❹" "❺" "❻" "❼"))
  :hook (org-mode . org-bullets-mode))
