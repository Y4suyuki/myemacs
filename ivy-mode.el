;; https://github.com/abo-abo/swiper
(use-package swiper)

(use-package ivy
  :after (swiper)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 15)
  (setq enable-recursive-minibuffers t)
  :bind
  ("\C-s" . 'swiper)
  ("M-x" . 'counsel-M-x)
  ("C-x b" . 'ivy-switch-buffer)
  ("C-c k" . 'counsel-ag))
