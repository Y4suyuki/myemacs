(defun toggle-transparency ()
  "toggle transparency"
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(75. 50) '(100 . 100)))))

(setq tstep 5)


(defun change-transparency (change)
  "change transparency value"
  (let ((cur-alpha (or (frame-parameter nil 'alpha) '(100 . 100)))
        (f (lambda (x) (cond ((> x 100) 100)
                             ((< x 0)     0)
                             (t x)))))
    (set-frame-parameter nil 'alpha
                         (cons (funcall f (+ (car cur-alpha) change))
                               (funcall f (+ (cdr cur-alpha) change))))))

(defun transparency-up ()
  "make less transparent"
  (interactive)
  (change-transparency 5))

(defun transparency-down ()
  "make more transparent"
  (interactive)
  (change-transparency -5))
