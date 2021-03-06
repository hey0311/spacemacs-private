;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (ivy :variables ivy-enable-advanced-buffer-information nil)
     better-defaults
     ranger
     ;; emoji
     (plantuml :variables plantuml-jar-path "~/.spacemacs.d/plantuml.jar")
     ;; lsp 加载失败
     ;; dap 加载失败
     colors
     prodigy
     ;; github
     search-engine
     graphviz
     (haskell :variables haskell-enable-hindent t
              haskell-completion-backend 'intero)
     (syntax-checking :variables syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips nil)
     (spell-checking :variables spell-checking-enable-by-default nil)
     ;; (vinegar :variables vinegar-reuse-dired-buffer t)
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (auto-completion :variables auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-tab-key-behavior 'cycle
                      :disabled-for org markdown)
     (osx :variables osx-dictionary-dictionary-choice "Simplified Chinese - English"
          osx-command-as 'super)
     restclient
     (gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
     (shell :variables shell-default-shell 'ansi-term
            shell-default-term-shell "/bin/zsh")
     ;; docker
     ;; latex
     deft
     ;; markdown
     (org :variables org-want-todo-bindings t
          org-enable-hugo-support t)
     ;; gpu 加载失败
     yaml
     react
     ;; (python :variables
     ;;         python-test-runner '(nose pytest)
     ;;         python-backend 'lsp
     ;;         python-lsp-server 'mspyls
     ;;         python-lsp-git-root "~/Github/python-language-server")
     ;; (ruby :variables ruby-version-manager 'chruby)
     ;; ruby-on-rails
     lua
     html
     (javascript :variables javascript-backend 'lsp)
     (typescript :variables
                 typescript-fmt-on-save nil
                 typescript-fmt-tool 'typescript-formatter
                 typescript-backend 'lsp)
     emacs-lisp
     (clojure :variables clojure-enable-fancify-symbols t)
     racket
     ;; (c-c++ :variables
     ;;        c-c++-default-mode-for-headers 'c++-mode
     ;;        c-c++-backend 'lsp-ccls
     ;;        c-c++-lsp-executable (file-truename "/usr/local/bin/ccls"))
     zilongshanren
     (chinese :variables
              chinese-enable-fcitx t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(sicp ssh-agency cnfonts real-auto-save imenu-list org-journal emacsql-sqlite org-roam org-roam-server org-super-agenda)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages
   '(org-projectile org-brain magit-gh-pulls magit-gitflow  evil-mc realgud tern company-tern
                    evil-args evil-ediff evil-exchange evil-unimpaired
                    evil-indent-plus volatile-highlights smartparens
                    spaceline holy-mode skewer-mode rainbow-delimiters
                    highlight-indentation vi-tilde-fringe eyebrowse ws-butler
                    smooth-scrolling org-repo-todo org-timer
                    livid-mode git-gutter git-gutter-fringe  evil-escape
                    leuven-theme gh-md evil-lisp-state spray lorem-ipsum symon
                    ac-ispell ace-jump-mode auto-complete auto-dictionary
                    clang-format define-word google-translate disaster epic
                    fancy-battery org-present orgit orglue spacemacs-theme
                    helm-flyspell flyspell-correct-helm clean-aindent-mode
                    helm-c-yasnippet ace-jump-helm-line helm-make magithub
                    helm-themes helm-swoop helm-spacemacs-help smeargle
                    ido-vertical-mode flx-ido company-quickhelp ivy-rich helm-purpose
                    )
   dotspacemacs-install-packages 'used-only
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one
                         doom-nova
                         spacemacs-dark)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Pro"
                               :size 14
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-init ()
  ;; (let ((fcitx-path "C:/Users/oppo/AppData/Roaming/.spacemacs.d/"))
  ;;   (setenv "PATH" (concat fcitx-path ";" (getenv "PATH")))
  ;;   (add-to-list 'exec-path fcitx-path))
  ;; (load-file fcitx-path1)
  ;; (require 'fcitx)
  ;; (fcitx-evil-turn-on)

  ;; 设置windows下的fcitx
  ;; (fcitx-evil-turn-on)
  ;; 设置输入法,最后还是决定把中文拼音给禁了吧,在win下会很卡,还不如用搜狗
  ;; (setq-default dotspacemacs-configuration-layers '((chinese :variables
  ;;                                                            chinese-enable-fcitx t)))
  ;; (setq default-input-method "pyim")
  ;; (setq pyim-page-tooltip 'popup)
  ;; (setq pyim-punctuation-translate-p '(no yes auto))
                                        ;使用半角标点。
  ;; (setq pyim-dicts
  ;;       '((:name "dict1" :file
  ;;                "~/.spacemacs.d/pyim-bigdict.pyim"
  ;;                )))
  ;; (add-hook 'emacs-startup-hook
  ;;           #'(lambda () (pyim-restart-1 t)))
  ;; (setq pyim-default-scheme 'pyim-shuangpin)

  ;; (setq configuration-layer--elpa-archives  
  ;;       '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")  
  ;;         ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")  
  ;;         ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t)

  
  (setq term-char-mode-point-at-process-mark nil)

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; ss proxy. But it will cause anacond-mode failed.
  (setq socks-server '("Default server" "127.0.0.1" 1080 5))
  (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  ;; hack for remove purpose mode
  ;; (setq purpose-mode nil)
  )

(defun dotspacemacs/user-config ()
  ;; =========================================以下是我的配置
  ;; 1.使用<s创建代码块
  (require 'org-tempo)
  ;; 2.org文件自动保存,每2分钟自动保存,避免卡顿
  (add-hook 'org-mode-hook 'real-auto-save-mode)
  (setq real-auto-save-interval 120) 

  ;; 3.设置deft的简介为空
  (setq deft-strip-summary-regexp ".*")
  ;; 4.设置字体等宽cnfont 让 cnfonts 随着 Emacs 自动生效。
  (cnfonts-enable)
  ;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
  (cnfonts-set-spacemacs-fallback-fonts)
  (require 'org-protocol)
  (require 'org-roam-protocol)
  (setq org-roam-index-file "D:/notes/roam/index.org")
  (setq org-roam-directory "d:/notes/roam/")
  (add-to-list 'org-roam-capture-templates
               '("j" "note" plain (function org-roam-capture--get-point)
                 "%?"
                 :file-name "%<%Y%m%d%H%M%S>-${slug}"
                 :head "#+title: ${title}\n#+source: \n#+roam_tags: \n#+roam_alias: \nlinks: "
                 :unnarrowed t
                 ))
  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${slug}"
           :head "#+title: ${title}\n#+roam_key: ${ref}\n"
           :unnarrowed t)))
  ;; 失去焦点时自动美化
  ;; 自动格式化代码块
  (defun indent-org-block-automatically ()
    (when (org-in-src-block-p)
      (org-edit-special)
      (indent-region (point-min) (point-max))
      (org-edit-src-exit)))
  (add-hook 'focus-out-hook 'indent-region-or-buffer)
  (add-hook 'focus-out-hook 'indent-org-block-automatically)
  (use-package org-roam-server
    :ensure t
    :config
    (setq org-roam-server-host "127.0.0.1"
          org-roam-server-port 8080
          org-roam-server-authenticate nil
          org-roam-server-export-inline-images t
          org-roam-server-serve-files nil
          org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
          org-roam-server-network-poll t
          org-roam-server-network-arrows nil
          org-roam-server-network-label-truncate t
          org-roam-server-network-label-truncate-length 60
          org-roam-server-network-label-wrap-length 20))
  ;; (run-at-time 1 10 'indent-org-block-automatically)
  ;; js文件用vscode打开
  (eval-after-load "org"
    '(progn
       ;; .txt files aren't in the list initially, but in case that changes
       ;; in a future version of org, use if to avoid errors
       (if (assoc "\\.js\\'" org-file-apps)
           (setcdr (assoc "\\.js\\'" org-file-apps) "cmd.exe %s")
         (add-to-list 'org-file-apps '("\\.js\\'" . "cmd %s") t))
       ;; Change .pdf association directly within the alist
       (setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s")))
  ;; (setq org-image-actual-width nil)
  ;; (add-to-list 'load-path (expand-file-name "C:/Users/Administrator/AppData/Roaming/.spacemacs.d"))

  ;; (require 'awesome-tab)

  ;; (awesome-tab-mode t)
  (setq    org-link-frame-setup
           '(
             (vm . vm-visit-folder)
             (vm-imap . vm-visit-imap-folder)
             (gnus . gnus)
             (file . find-file)
             (wl . wl-frame)
             ))
  (defvar org-startup-folded '(showall))
  (setq org-image-actual-width nil)
  
  (with-eval-after-load 'org (defvar org-inline-image-resize-function
                               #'org-inline-image-resize
                               "Function that takes a filename and resize argument and returns
 a new filename pointing to the resized image.")

                        (defun org-inline-image-resize (fname resize-options)
                          "Resize FNAME with RESIZE-OPTIONS.
RESIZE-OPTIONS are passed to \"mogrify resized-fname -resize resize-options\".
RESIZE-OPTIONS could be:
N% to scale the image by a percentage.
N to set the width, keeping the aspect ratio constant.
xN to set the height, keeping the aspect ratio constant.
NxM! to set the width and height, ignoring the aspect ratio.
See http://www.imagemagick.org/Usage/resize/#resize for more options."
                          (let* ((md5-hash (with-temp-buffer (insert-file-contents fname)
                                                             (insert (format "%s" resize-options))
                                                             (md5 (buffer-string))))
                                 (resized-fname (concat (expand-file-name
                                                         md5-hash
                                                         temporary-file-directory)
                                                        "."
                                                        (file-name-extension fname)))
                                 (cmd (format "mogrify -resize %s %s"
                                              resize-options
                                              resized-fname)))
                            (if (not (executable-find "mogrify"))
                                (progn
                                  (message "No mogrify executable found. To eliminate this message, set  `org-inline-image-resize-function' to nil or install imagemagick from http://www.imagemagick.org/script/binary-releases.php")
                                  fname)
                              (unless (file-exists-p resized-fname)
                                (copy-file fname resized-fname)
                                (shell-command cmd))
                              resized-fname)))

                        ;; this is copied and modified from org.el
                        (defun org-display-inline-images (&optional include-linked refresh beg end)
                          "Display inline images.
An inline image is a link which follows either of these
conventions:
  1. Its path is a file with an extension matching return value
     from `image-file-name-regexp' and it has no contents.
  2. Its description consists in a single link of the previous
     type.
When optional argument INCLUDE-LINKED is non-nil, also links with
a text description part will be inlined.  This can be nice for
a quick look at those images, but it does not reflect what
exported files will look like.
When optional argument REFRESH is non-nil, refresh existing
images between BEG and END.  This will create new image displays
only if necessary.  BEG and END default to the buffer
boundaries."
                          (interactive "P")
                          (when (display-graphic-p)
                            (unless refresh
                              (org-remove-inline-images)
                              (when (fboundp 'clear-image-cache) (clear-image-cache)))
                            (org-with-wide-buffer
                             (goto-char (or beg (point-min)))
                             (let ((case-fold-search t)
                                   (file-extension-re (image-file-name-regexp)))
                               (while (re-search-forward "[][]\\[\\(?:file\\|[./~]\\)" end t)
                                 (let ((link (save-match-data (org-element-context))))
                                   ;; Check if we're at an inline image.
                                   (when (and (equal (org-element-property :type link) "file")
                                              (or include-linked
                                                  (not (org-element-property :contents-begin link)))
                                              (let ((parent (org-element-property :parent link)))
                                                (or (not (eq (org-element-type parent) 'link))
                                                    (not (cdr (org-element-contents parent)))))
                                              (org-string-match-p file-extension-re
                                                                  (org-element-property :path link)))
                                     (let ((file (expand-file-name
                                                  (org-link-unescape
                                                   (org-element-property :path link)))))
                                       (when (file-exists-p file)
                                         (let ((width
                                                ;; Apply `org-image-actual-width' specifications.
                                                (cond
                                                 ((and (not (image-type-available-p 'imagemagick))
                                                       (not org-inline-image-resize-function))
                                                  nil)
                                                 ((eq org-image-actual-width t) nil)
                                                 ((listp org-image-actual-width)
                                                  (or
                                                   ;; First try to find a width among
                                                   ;; attributes associated to the paragraph
                                                   ;; containing link.
                                                   (let* ((paragraph
                                                           (let ((e link))
                                                             (while (and (setq e (org-element-property
                                                                                  :parent e))
                                                                         (not (eq (org-element-type e)
                                                                                  'paragraph))))
                                                             e))
                                                          (attr_org (org-element-property :attr_org paragraph)))
                                                     (when attr_org
                                                       (plist-get
                                                        (org-export-read-attribute :attr_org  paragraph) :width)))
                                                   ;; Otherwise, fall-back to provided number.
                                                   (car org-image-actual-width)))
                                                 ((numberp org-image-actual-width)
                                                  org-image-actual-width)))
                                               (old (get-char-property-and-overlay
                                                     (org-element-property :begin link)
                                                     'org-image-overlay))) 
                                           (if (and (car-safe old) refresh)
                                               (image-refresh (overlay-get (cdr old) 'display))
                                             
                                             (when (and width org-inline-image-resize-function)
                                               (setq file (funcall  org-inline-image-resize-function file width)
                                                     width nil))
                                             (let ((image (create-image file
                                                                        (cond
                                                                         ((image-type-available-p 'imagemagick)
                                                                          (and width 'imagemagick))
                                                                         (t nil)) 
                                                                        nil
                                                                        :width width)))
                                               (when image
                                                 (let* ((link
                                                         ;; If inline image is the description
                                                         ;; of another link, be sure to
                                                         ;; consider the latter as the one to
                                                         ;; apply the overlay on.
                                                         (let ((parent
                                                                (org-element-property :parent link)))
                                                           (if (eq (org-element-type parent) 'link)
                                                               parent
                                                             link)))
                                                        (ov (make-overlay
                                                             (org-element-property :begin link)
                                                             (progn
                                                               (goto-char
                                                                (org-element-property :end link))
                                                               (skip-chars-backward " \t")
                                                               (point)))))
                                                   (overlay-put ov 'display image)
                                                   (overlay-put ov 'face 'default)
                                                   (overlay-put ov 'org-image-overlay t)
                                                   (overlay-put
                                                    ov 'modification-hooks
                                                    (list 'org-display-inline-remove-overlay))
                                                   (push ov org-inline-image-overlays)))))))))))))))

                        ;; * Enable pdf and eps images in org-mode
                        ;; Suggested on the org-mode maillist by Julian Burgos
                        ;; (add-to-list 'image-file-name-extensions "pdf")
                        (add-to-list 'image-file-name-extensions "eps")

                        (add-to-list 'image-type-file-name-regexps '("\\.eps\\'" . imagemagick))
                        (add-to-list 'image-file-name-extensions "eps") )
  ;; ====================================以下是spacemacs默认配置
  (eval-and-compile
    (if (fboundp 'window-inside-edges)
        ;; Emacs devel.
        (defalias 'th-window-edges
          'window-inside-edges)
      ;; Emacs 21
      (defalias 'th-window-edges
        'window-edges)
      ))
  
  (defun th-point-position ()
    "Return the location of POINT as positioned on the selected frame.
Return a cons cell (X . Y)"
    (let* ((w (selected-window))
           (f (selected-frame))
           (edges (th-window-edges w))
           (col (current-column))
           (row (count-lines (window-start w) (point)))
           (x (+ (car edges) col))
           (y (+ (car (cdr edges)) row)))
      (cons x y)))


  (defun get-point-pixel-position ()
    "Return the position of point in pixels within the frame."
    (let ((point-pos (th-point-position)))
      (th-get-pixel-position (car point-pos) (cdr point-pos))))
  

  (defun th-get-pixel-position (x y)
    "Return the pixel position of location X Y (1-based) within the frame."
    (let ((old-mouse-pos (mouse-position)))
      (set-mouse-position (selected-frame)
                          ;; the fringe is the 0th column, so x is OK
                          x
                          (1- y))
      (let ((point-x (car (cdr (mouse-pixel-position))))
            (point-y (cdr (cdr (mouse-pixel-position)))))
        ;; on Linux with the Enlightenment window manager restoring the
        ;; mouse coordinates didn't work well, so for the time being it
        ;; is enabled for Windows only
        (when (eq window-system 'w32)        
          (set-mouse-position 
           (selected-frame)
           (cadr old-mouse-pos)
           (cddr old-mouse-pos)))
        (cons point-x point-y))))

  (defun display-current-input-method-title (arg1 &optional arg2 arg3)
    "display current input method name"
    (when current-input-method-title
      (set-mouse-position (selected-frame) (car (th-point-position)) (cdr (th-point-position)))
      (x-show-tip current-input-method-title (selected-frame) nil 1  20 -30)))

  (advice-add 'evil-insert :after 'display-current-input-method-title)
  
  ;;解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-mac) window-system)
      (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

  ;; Setting Chinese Font
  (when (and (spacemacs/system-is-mswindows) window-system)
    (setq ispell-program-name "aspell")
    (setq w32-pass-alt-to-system nil)
    (setq w32-apps-modifier 'super)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "Microsoft Yahei" :size 14))))

  (fset 'evil-visual-update-x-selection 'ignore)

  ;; force horizontal split window
  (setq split-width-threshold 120)
  ;; (linum-relative-on)

  ;; (spacemacs|add-company-backends :modes text-mode)

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; temp fix for ivy-switch-buffer
  ;; (spacemacs/set-leader-keys "bb" 'helm-mini)

  (global-hungry-delete-mode t)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  (spacemacs|diminish counsel-mode)

  (evilified-state-evilify-map special-mode-map :mode special-mode)

  (add-to-list 'auto-mode-alist
               '("Capstanfile\\'" . yaml-mode))

  (defun js-indent-line ()
    "Indent the current line as JavaScript."
    (interactive)
    (let* ((parse-status
            (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (point) (save-excursion (back-to-indentation) (point)))))
      (if (nth 3 parse-status)
          'noindent
        (indent-line-to (js--proper-indentation parse-status))
        (when (> offset 0) (forward-char offset)))))

  (global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
  (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
  (defun un-indent-by-removing-4-spaces ()
    "remove 4 spaces from beginning of of line"
    (interactive)
    (save-excursion
      (save-match-data
        (beginning-of-line)
        ;; get rid of tabs at beginning of line
        (when (looking-at "^\\s-+")
          (untabify (match-beginning 0) (match-end 0)))
        (when (looking-at (concat "^" (make-string tab-width ?\ )))
          (replace-match "")))))

  (defun zilongshanren/toggle-major-mode ()
    (interactive)
    (if (eq major-mode 'fundamental-mode)
        (set-auto-mode)
      (fundamental-mode)))
  (spacemacs/set-leader-keys "otm" 'zilongshanren/toggle-major-mode)

  (setq inhibit-compacting-font-caches t)
  (global-display-line-numbers-mode -1)

  (defun moon-override-yank-pop (&optional arg)
    "Delete the region before inserting poped string."
    (when (and evil-mode (eq 'visual evil-state))
      (kill-region (region-beginning) (region-end))))

  (advice-add 'counsel-yank-pop :before #'moon-override-yank-pop)
  (setq ivy-more-chars-alist '((counsel-ag . 2)
                               (counsel-grep .2)
                               (t . 3)))

  ;; boost find file and load saved persp layout  performance
  ;; which will break some function on windows platform
  ;; eg. known issues: magit related buffer color, reopen will fix it
  (when (spacemacs/system-is-mswindows)
    (progn (setq find-file-hook nil)
           (setq vc-handled-backends nil)
           (setq magit-refresh-status-buffer nil)
           (add-hook 'find-file-hook 'spacemacs/check-large-file)

           ;; emax.7z in not under pdumper release
           ;; https://github.com/m-parashar/emax64/releases/tag/pdumper-20180619
           (defvar emax-root (concat (expand-file-name "~") "/emax"))

           (when (file-exists-p emax-root)
             (progn
               (defvar emax-root (concat (expand-file-name "~") "/emax"))
               (defvar emax-bin64 (concat emax-root "/bin64"))
               (defvar emax-mingw64 (concat emax-root "/mingw64/bin"))
               (defvar emax-lisp (concat emax-root "/lisp"))

               (setq exec-path (cons emax-bin64 exec-path))
               (setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

               (setq exec-path (cons emax-mingw64 exec-path))
               (setenv "PATH" (concat emax-mingw64 ";" (getenv "PATH")))
               ))

           (add-hook 'projectile-mode-hook '(lambda () (remove-hook 'find-file-hook #'projectile-find-file-hook-function)))))

  (setq exec-path (cons "/Users/lionqu/.nvm/versions/node/v10.16.0/bin/" exec-path))
  (setenv "PATH" (concat "/Users/lionqu/.nvm/versions/node/v10.16.0/bin:" (getenv "PATH")))

  (defun counsel-locate-cmd-es (input)
    "Return a shell command based on INPUT."
    (counsel-require-program "es.exe")
    (encode-coding-string (format "es.exe -i -r -p %s"
                                  (counsel-unquote-regex-parens
                                   (ivy--regex input t)))
                          'gbk))
  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-spelling-checking-on)

  ;; (add-hook 'org-mode-hook 'emojify-mode)
  ;; (add-hook 'org-mode-hook 'auto-fill-mode)

  ;; https://emacs-china.org/t/ox-hugo-auto-fill-mode-markdown/9547/4
  (defadvice org-hugo-paragraph (before org-hugo-paragraph-advice
                                        (paragraph contents info) activate)
    "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to hugo markdown."
    (let* ((origin-contents (ad-get-arg 1))
           (fix-regexp "[[:multibyte:]]")
           (fixed-contents
            (replace-regexp-in-string
             (concat
              "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
      (ad-set-arg 1 fixed-contents)))

  ;; fix for the magit popup doesn't have a q keybindings
  (with-eval-after-load 'transient
    (transient-bind-q-to-quit))

  ;; fix for the lsp error
  (defvar spacemacs-jump-handlers-fundamental-mode nil))

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  )
