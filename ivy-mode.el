;; https://github.com/abo-abo/swiper
(use-package swiper)

(use-package ivy
  :after (swiper)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind
  ("\C-s" . 'swiper))
