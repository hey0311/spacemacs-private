;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(command-log-mode-window-size 50)
 '(company-dabbrev-minimum-length 3)
 '(company-dabbrev-other-buffers nil)
 '(company-show-numbers t)
 '(company-statistics-auto-restore nil)
 '(ctags-update-delay-seconds 1024)
 '(default-input-method "pyim")
 '(erc-nick "zilongshanren")
 '(erc-port 6666)
 '(evil-want-C-i-jump t)
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(expand-region-contract-fast-key "V")
 '(expand-region-exclude-text-mode-expansions (quote (html-mode nxml-mode web-mode)))
 '(expand-region-reset-fast-key "r")
 '(fci-rule-color "#5B6268" t)
 '(global-command-log-mode nil)
 '(helm-buffer-max-length 56)
 '(helm-move-to-line-cycle-in-source t)
 '(ivy-height 18)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(lsp-ui-flycheck-live-reporting nil)
 '(lua-documentation-url "http://www.lua.org/manual/5.3/manual.html")
 '(magit-use-overlays nil)
 '(objed-cursor-color "#ff6c6b")
 '(only-global-abbrevs t)
 '(org-agenda-custom-commands nil)
 '(org-agenda-files
   (quote
    ("d:/notes/journal/20200114.org" "d:/notes/journal/20200115.org" "d:/notes/journal/20200116.org" "d:/notes/journal/20200122.org" "d:/notes/journal/20200124.org" "d:/notes/journal/20200125.org" "d:/notes/journal/20200126.org" "d:/notes/journal/20200127.org" "d:/notes/journal/20200128.org" "d:/notes/journal/20200312.org" "d:/notes/journal/20200313.org" "d:/notes/journal/20200315.org" "d:/notes/journal/20200316.org" "d:/notes/journal/20200317.org" "d:/notes/journal/20200318.org" "d:/notes/journal/20200319.org" "d:/notes/journal/20200320.org" "d:/notes/journal/20200321.org" "d:/notes/journal/20200322.org" "d:/notes/journal/20200323.org" "d:/notes/journal/20200324.org" "d:/notes/journal/20200325.org" "d:/notes/journal/20200326.org" "d:/notes/journal/20200327.org" "d:/notes/journal/20200330.org" "d:/notes/journal/20200331.org" "d:/notes/journal/20200401.org" "d:/notes/journal/20200402.org" "d:/notes/journal/20200403.org" "d:/notes/journal/20200407.org" "d:/notes/journal/20200408.org" "d:/notes/journal/20200409.org" "d:/notes/journal/20200410.org" "d:/notes/journal/20200411.org" "d:/notes/journal/20200412.org" "d:/notes/journal/20200413.org" "d:/notes/journal/20200415.org" "d:/notes/journal/20200416.org" "d:/notes/journal/20200417.org" "d:/notes/journal/20200420.org" "d:/notes/journal/20200421.org" "d:/notes/journal/20200422.org" "d:/notes/journal/20200423.org" "d:/notes/journal/20200424.org" "d:/notes/journal/20200426.org" "d:/notes/journal/20200427.org" "d:/notes/journal/20200429.org" "d:/notes/journal/20200430.org" "d:/notes/journal/20200507.org" "d:/notes/journal/20200508.org" "d:/notes/journal/20200511.org" "d:/notes/journal/20200512.org" "d:/notes/journal/20200513.org" "d:/notes/journal/20200515.org" "d:/notes/journal/20200518.org" "d:/notes/journal/20200527.org" "d:/notes/journal/20200528.org" "d:/notes/journal/20200529.org" "d:/notes/journal/20200601.org" "d:/notes/journal/journal.org" "d:/notes/journal/weekplan.org" "d:/notes/front.org")))
 '(org-agenda-ndays 1)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-text-search-extra-files (quote (agenda-archives)))
 '(org-deadline-warning-days 14)
 '(org-drill-add-random-noise-to-intervals-p t)
 '(org-drill-learn-fraction 0.3)
 '(org-drill-scope (quote agenda))
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-eww org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-drill org-learn)))
 '(org-pomodoro-play-sounds nil)
 '(org-reverse-note-order t)
 '(package-selected-packages
   (quote
    (org-roam-server org-roam xr org-journal ts real-auto-save cnfonts pinyin-search org-drill persist anki-editor pyim-basedict pyim org-super-agenda pangu-spacing find-by-pinyin-dired chinese-wbim chinese-conv ace-pinyin pinyinlib python unicode-escape company-tabnine plantuml-mode dap-mode bui tree-mode lsp-ui lsp-treemacs lsp-python-ms helm-lsp cquery company-lsp ccls forge closql emacsql-sqlite emacsql cpp-auto-include company-reftex parseedn lv parseclj a ox-hugo emojify emoji-cheat-sheet-plus company-emoji ob-typescript deadgrep org-cliplink devdocs ssh-agency org-projectile org-category-capture treemacs-projectile treemacs-evil treemacs pfuture transient osx-clipboard lsp-haskell lsp-mode flycheck-package package-lint evil-textobj-line blacken dante lcr company-ghc ghc helm-hoogle intero hlint-refactor hindent haskell-snippets flycheck-haskell company-ghci haskell-mode company-cabal cmm-mode imenu-list writeroom-mode visual-fill-column symbol-overlay treepy graphql sound-wav caps-lock doom-modeline eldoc-eval shrink-path ivy-rich prettier-js ivy-yasnippet gitignore-templates evil-goggles sesman dotenv-mode rjsx-mode magit-svn json-navigator hierarchy yasnippet-snippets spaceline-all-the-icons all-the-icons memoize pippel pipenv overseer org-mime nameless ivy-xref ivy-rtags importmagic epc concurrent google-c-style flycheck-rtags evil-cleverparens counsel-gtags counsel-css company-rtags rtags clojure-cheatsheet centered-cursor-mode font-lock+ ghub let-alist seq restclient-helm org-brain sayid evil-lion auctex-latexmk auctex password-generator realgud test-simple loc-changes load-relative company-lua blog-admin string-inflection opencl-mode cuda-mode symon rspec-mode fuzzy browse-at-remote winum helm-swoop unfill highlight-global marshal ht ob-restclient company-restclient know-your-http-well counsel-projectile lispy counsel swiper ivy-purpose hide-comnt helm-purpose window-purpose zoutline minitest glsl-mode pug-mode magithub editorconfig dockerfile-mode docker tablist docker-tramp helm-projectile xterm-color shell-pop eshell-z eshell-prompt-extras esh-help graphviz-dot-mode py-isort dumb-jump restclient racket-mode faceup projectile-rails ob-http helm-gtags feature-mode company-auctex rvm ruby-tools ruby-test-mode rubocop robe rbenv rake enh-ruby-mode chruby bundler inf-ruby yapfify sicp helm-mode-manager org origami tiny evil-unimpaired helm-pydoc unicode-whitespace github-search flycheck-clojure evil-escape mwim helm-github-stars fcitx solarized-theme tide typescript-mode spaceline powerline org-plus-contrib ivy-hydra helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-ag helm helm-core flyspell-correct-ivy color-identifiers-mode ag bracketed-paste paradox inflections cider names yaml-mode which-key wgrep uuidgen toc-org smex smeargle smartparens reveal-in-osx-finder restart-emacs ranger pytest py-yapf prodigy persp-mode pcre2el osx-trash org-pomodoro mmm-mode markdown-mode lua-mode live-py-mode link-hint launchctl js2-mode jade-mode info+ ibuffer-projectile projectile hy-mode htmlize hl-todo help-fns+ haml-mode gnuplot gitignore-mode github-clone popup git-gutter-fringe+ git-gutter+ flyspell-correct flycheck evil-visual-mark-mode evil-magit magit-popup git-commit with-editor evil-indent-plus iedit evil-ediff evil undo-tree diminish diff-hl ivy tern company column-enforce-mode cmake-mode clojure-snippets eval-sexp-fu pkg-info clojure-mode bind-map bind-key yasnippet auto-compile packed anaconda-mode pythonic ace-window ace-link avy quelpa package-build wrap-region visual-regexp-steroids visual-regexp peep-dired osx-dictionary nodejs-repl litable keyfreq gulpjs find-file-in-project etags-select ctags-update beacon 4clojure moe-theme edn paredit queue peg json-rpc dash-functional web-completion-data makey anzu highlight goto-chg flx gh logito pcache pos-tip guide-key request parent-mode simple-httpd json-snatcher json-reformat multiple-cursors moz ctable orglue epic alert log4e gntp spinner epl hydra async deferred f s chinese-word-at-point dash youdao-dictionary ws-butler web-mode web-beautify volatile-highlights vi-tilde-fringe use-package tagedit smooth-scrolling slim-mode scss-mode sass-mode rfringe reveal-in-finder rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pyenv-mode popwin pip-requirements persp-projectile pbcopy page-break-lines ox-reveal org-repo-todo org-present org-octopress org-mac-link org-download org-bullets open-junk-file neotree multi-term moz-controller move-text monokai-theme markdown-toc magit macrostep linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc indent-guide impatient-mode ido-vertical-mode hungry-delete hl-anything highlight-parentheses highlight-numbers highlight-indentation guide-key-tip google-translate golden-ratio github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md ggtags geiser fringe-helper flycheck-ycmd flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-tutor evil-terminal-cursor-changer evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-jumper evil-indent-textobject evil-iedit-state evil-exchange evil-args evil-anzu engine-mode emmet-mode elisp-slime-nav elfeed discover-my-major deft dash-at-point cython-mode company-ycmd company-web company-tern company-statistics company-quickhelp company-c-headers company-anaconda command-log-mode coffee-mode cmake-font-lock clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chinese-fonts-setup buffer-move auto-yasnippet auto-highlight-symbol auto-dictionary align-cljlet aggressive-indent adaptive-wrap ace-jump-mode ac-ispell 2048-game)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((git-commit-major-mode . git-commit-elisp-text-mode)
     (typescript-backend . tide)
     (javascript-backend . tern)
     (eval progn
           (pp-buffer)
           (indent-buffer))
     (typescript-backend . lsp)
     (javascript-backend . lsp)
     (eval setenv "PYTHONPATH" "/Users/guanghui/cocos2d-x/tools/cocos2d-console/plugins:/Users/guanghui/cocos2d-x/tools/cocos2d-console/bin"))))
 '(sp-show-pair-from-inside t)
 '(tags-revert-without-query t)
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(web-mode-markup-indent-offset 2)
 '(ycmd-extra-conf-handler (quote load))
 '(ycmd-extra-conf-whitelist (quote ("~/cocos2d-x/*"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-definition-face ((t (:foreground "#d33682" :slant normal :weight bold))))
 '(ahs-face ((t (:foreground "#d33682" :weight bold))))
 '(command-log-command ((t (:foreground "dark magenta"))))
 '(command-log-key ((t (:foreground "dark cyan"))))
 '(git-gutter-fr:added ((t (:foreground "#859900" :weight bold :width extra-expanded))))
 '(iedit-occurrence ((t (:inherit cursor))))
 '(ivy-virtual ((t (:background "skyblue"))))
 '(js2-external-variable ((t (:foreground "plum3"))))
 '(mc/cursor-bar-face ((t (:background "chartreuse3"))))
 '(show-paren-match ((t (:background "dark gray" :foreground "#d33682" :weight bold))))
 '(sp-show-pair-match-face ((t (:background "#272822" :foreground "gray" :inverse-video t :weight normal))))
 '(web-mode-current-element-highlight-face ((t (:background "dark gray")))))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
