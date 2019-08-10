(defvar org-agenda-dir ""
  "gtd org files location")

(defvar deft-dir ""
  "deft org files locaiton")

(defvar blog-admin-dir ""
  "blog-admin files location")

(if (spacemacs/system-is-mswindows)
    (setq
     org-agenda-dir "d:/notes"
     deft-dir "d:/notes"
     config-dir "d:/notes"
     ciku-file "/Users/heyong/.spacemacs.d/pyim-bigdict.pyim"
     blog-admin-dir "f:/zilongshanren.com")
  (setq
   org-agenda-dir "~/notes"
   deft-dir "~/notes"
   config-dir "~/.spacemacs.d"
   ciku-file "/Users/heyong/.spacemacs.d/pyim-bigdict.pyim"
   blog-admin-dir "~/zilongshanren.com"))


;;load sensitive data
;; or (like spacemacs init.el)put the above variable into it ,then the own value separated from public config
;; .emacs.secrets.el for example:
;; (setq-default
;;  org-agenda-dir "~/Dropbox/Apps/emacs/gtd"
;;  deft-dir "~/Dropbox/Apps/emacs/notes"
;;  blog-admin-dir "~/Documents/hexo"
;;  )
;; (slack-register-team
;;   :name "emacs-slack"
;;   :default t
;;   :client-id "xxxxxxxxx"
;;   :client-secret "xxxxxxxxx"
;;   :token "xxxxxxxxx"
;;   :subscribed-channels '(xxxxxxxxx))
;; (setq paradox-github-token "")
;; (load "~/Dropbox/Apps/emacs/.emacs.secrets.el" t)
