(use-package mmm-mode
  :ensure t
  :config
  (mmm-add-classes
   '((js-graphql
      :submode graphql-mode
      :face mmm-declaration-submode-face
      :front "[^a-zA-Z]gql`"
      :back "`")))
  (mmm-add-mode-ext-class 'rjsx-mode nil 'js-graphql)
  (setq mmm-global-mode 't))
