(defun get-api-key (hostname)
  "Retrieve API key for HOSTNAME from auth-source (usually ~/.authinfo).
The function searches for an entry with the specified HOSTNAME and
username \"apikey\", then returns the secret/password if found.

HOSTNAME is a string representing the host entry in source.

Returns the API key as a string, or nil if no matching entry is found."
  (let ((auth-info (auth-source-search :host hostname
                                       :user "apikey"
                                       :require '(:secret))))
    (when auth-info
      (funcall (plist-get (car auth-info) :secret)))))

(use-package gptel
  :ensure t
  :hook
  ((gptel-post-stream . gptel-auto-scroll)
   (gptel-post-response . gptel-end-of-response))
  :config
  (setq gptel-model 'claude-3-7-sonnet-20250219
        gptel-backend (gptel-make-anthropic "Claude"
                        :stream t :key (get-api-key "api.anthropic.com")))
  (gptel-make-gemini "Gemini" :key (get-api-key "generativeai.googleapis.com") :stream t))

