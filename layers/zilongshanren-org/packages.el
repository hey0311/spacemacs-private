;;; packages.el --- zilong-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2014-2016 zilongshanren
;;
;; Author: guanghui <guanghui8827@gmail.com>
;; URL: https://github.com/zilongshanren/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst zilongshanren-org-packages
  '(
    (org :location built-in)
    ;; org-mac-link
    org-pomodoro
    deft
    sound-wav
    ob-typescript
    org-super-agenda
    ;; org-tree-slide
    ;; ox-reveal
    ;; worf
    ;; org-download
    ;; plain-org-wiki
    org-drill
    )
  )

(defun zilongshanren-org/init-org-super-agenda ()
  )
(defun zilongshanren-org/init-org-drill()
  )
(defun zilongshanren-org/post-init-org-pomodoro ()
  (zilongshanren/pomodoro-notification))

;;In order to export pdf to support Chinese, I should install Latex at here: https://www.tug.org/mactex/
;; http://freizl.github.io/posts/2012-04-06-export-orgmode-file-in-Chinese.html
;;http://stackoverflow.com/questions/21005885/export-org-mode-code-block-and-result-with-different-styles
(defun zilongshanren-org/post-init-org ()
  (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org
    (progn

      ;; Allow multiple line Org emphasis markup.
      ;; http://emacs.stackexchange.com/a/13828/115
      (setcar (nthcdr 4 org-emphasis-regexp-components) 20) ;Up to 20 lines, default is just 1
      ;; Below is needed to apply the modified `org-emphasis-regexp-components'
      ;; settings from above.
      (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

      ;; (defun th/org-outline-context-p ()
      ;;   (re-search-backward org-outline-regexp))
      ;; ;; Some usages
      ;; (th/define-context-key org-mode
      ;;                        (kbd "RET")
      ;;                        (when (th/outline-context-p)
      ;;                          'org-insert-heading-respect-content))

      ;; Jump out of a TeX macro when pressing TAB twice.
      ;; (th/define-context-key TeX-mode-map (kbd "TAB")
      ;;                        (when (and (= 1 (length (this-command-keys-vector)))
	  ;;                                   (equal last-command-event (elt (this-command-keys-vector) 0))
	  ;;                                   (TeX-current-macro))
	  ;;                          #'th/TeX-goto-macro-end)))
      
      (spacemacs|disable-company org-mode)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "," 'org-priority)
      (require 'org-compat)
      (require 'org)
      ;; (add-to-list 'org-modules "org-habit")
      (add-to-list 'org-modules 'org-habit)
      (require 'org-habit)

      (setq org-refile-use-outline-path 'file)
      (setq org-outline-path-complete-in-steps nil)
      (setq org-refile-targets
            '((nil :maxlevel . 4)
              (org-agenda-files :maxlevel . 4)))
      ;; config stuck project
      (setq org-stuck-projects
            '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

      (setq org-agenda-inhibit-startup t) ;; ~50x speedup
      (setq org-agenda-span 'day)
      (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
      (setq org-agenda-window-setup 'current-window)
      (setq org-log-done t)
      ;; 设置导出ascii时不折行
      (setq org-ascii-text-width 9999)
      ;; agenda view直接查看标题内容
      (setq org-agenda-follow-indirect t)
      ;; 设置org文件初始折叠状态为展开
      ;; (setq org-startup-folded nil)
      ;; 加密文章
      ;; "http://coldnew.github.io/blog/2013/07/13_5b094.html"
      ;; org-mode 設定
      (require 'org-crypt)

      ;; 當被加密的部份要存入硬碟時，自動加密回去
      (org-crypt-use-before-save-magic)

      ;; 設定要加密的 tag 標籤為 secret
      (setq org-crypt-tag-matcher "secret")

      ;; 避免 secret 這個 tag 被子項目繼承 造成重複加密
      ;; (但是子項目還是會被加密喔)
      (setq org-tags-exclude-from-inheritance (quote ("secret")))

      ;; 用於加密的 GPG 金鑰
      ;; 可以設定任何 ID 或是設成 nil 來使用對稱式加密 (symmetric encryption)
      (setq org-crypt-key nil)

      ;; 设置org-jounary的目录
      (setq org-journal-dir (expand-file-name "journal/" org-agenda-dir))
      ;; 恼人的换行问题
      (setq global-visual-line-mode t)
      ;; (setq auto-fill-mode nil)
      ;; 设置org-journal的一天结束时间
      (setq org-extend-today-until 4)
      (setq org-journal-enable-agenda-integration t)
      (defun org-journal-find-location ()
        ;; Open today's journal, but specify a non-nil prefix argument in order to
        ;; inhibit inserting the heading; org-capture will insert the heading.
        (org-journal-new-entry t)
        ;; Position point on the journal's top-level heading so that org-capture
        ;; will add the new entry as a child entry.
        (goto-char (point-min)))

      (setq org-capture-templates '())
      ;; (add-to-list 'auto-mode-alist '("\.org\\'" . org-mode))

      ;; (setq org-todo-keywords (quote ( (sequence "SOMEDAY(s)" "TODO(t!)" "|" "DONE(d!)" "CANCELLED(c)" ))))
      ;; 调试好久的颜色，效果超赞！todo keywords 增加背景色
      ;; (setf org-todo-keyword-faces '(("SOMEDAY" . (:foreground "white" :background "#95A5A6" :weight bold))
      ;;                                ("TODO" . (:foreground "white" :background "#2E8B57" :weight bold))
      ;;                                ("DONE" . (:foreground "white" :background "#3498DB" :weight bold))
      ;;                                ("CANCELLED" . (:foreground "white" :background "#3498DB" :weight bold))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; Change task state to STARTED when clocking in
      ;; (setq org-clock-in-switch-to-state "STARTED")
      ;; Save clock data and notes in the LOGBOOK drawer
      (setq org-clock-into-drawer t)
      ;; Removes clocked tasks with 0:00 duration
      (setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

      (setq org-tags-match-list-sublevels nil)

      (add-hook 'org-mode-hook '(lambda ()
                                  ;; keybinding for editing source code blocks
                                  ;; keybinding for inserting code blocks
                                  (local-set-key (kbd "C-c i s")
                                                 'zilongshanren/org-insert-src-block)))
      (require 'ox-publish)
      (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
                                        [NO-DEFAULT-PACKAGES]
                                        \\usepackage[utf8]{inputenc}
                                        \\usepackage[T1]{fontenc}
                                        \\usepackage{fixltx2e}
                                        \\usepackage{graphicx}
                                        \\usepackage{longtable}
                                        \\usepackage{float}
                                        \\usepackage{wrapfig}
                                        \\usepackage{rotating}
                                        \\usepackage[normalem]{ulem}
                                        \\usepackage{amsmath}
                                        \\usepackage{textcomp}
                                        \\usepackage{marvosym}
                                        \\usepackage{wasysym}
                                        \\usepackage{amssymb}
                                        \\usepackage{booktabs}
                                        \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
                                        \\tolerance=1000
                                        \\usepackage{listings}
                                        \\usepackage{xcolor}
                                        \\lstset{
                                        %行号
                                        numbers=left,
                                        %背景框
                                        framexleftmargin=10mm,
                                        frame=none,
                                        %背景色
                                        %backgroundcolor=\\color[rgb]{1,1,0.76},
                                        backgroundcolor=\\color[RGB]{245,245,244},
                                        %样式
                                        keywordstyle=\\bf\\color{blue},
                                        identifierstyle=\\bf,
                                        numberstyle=\\color[RGB]{0,192,192},
                                        commentstyle=\\it\\color[RGB]{0,96,96},
                                        stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},
                                        %显示空格
                                        showstringspaces=false
                                        }
                                        "
                                        ("\\section{%s}" . "\\section*{%s}")
                                        ("\\subsection{%s}" . "\\subsection*{%s}")
                                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

      ;; {{ export org-mode in Chinese into PDF
      ;; @see http://freizl.github.io/posts/tech/2012-04-06-export-orgmode-file-in-Chinese.html
      ;; and you need install texlive-xetex on different platforms
      ;; To install texlive-xetex:
      ;;    `sudo USE="cjk" emerge texlive-xetex` on Gentoo Linux
      ;; }}
      (setq org-latex-default-class "ctexart")
      (setq org-latex-pdf-process
            '(
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "rm -fr %b.out %b.log %b.tex auto"))

      (setq org-latex-listings t)

      (defun org-random-entry (&optional arg)
        "Select and goto a random todo item from the global agenda"
        (interactive "P")
        (if org-agenda-overriding-arguments
            (setq arg org-agenda-overriding-arguments))
        (if (and (stringp arg) (not (string-match "\\S-" arg))) (setq arg nil))
        (let* ((today (org-today))
               (date (calendar-gregorian-from-absolute today))
               (kwds org-todo-keywords-for-agenda)
               (lucky-entry nil)
               (completion-ignore-case t)
               (org-agenda-buffer (when (buffer-live-p org-agenda-buffer)
                                    org-agenda-buffer))
               (org-select-this-todo-keyword
                (if (stringp arg) arg
                  (and arg (integerp arg) (> arg 0)
                       (nth (1- arg) kwds))))
               rtn rtnall files file pos marker buffer)
          (when (equal arg '(4))
            (setq org-select-this-todo-keyword
                  (org-icompleting-read "Keyword (or KWD1|K2D2|...): "
                                        (mapcar 'list kwds) nil nil)))
          (and (equal 0 arg) (setq org-select-this-todo-keyword nil))
          (catch 'exit
            (org-compile-prefix-format 'todo)
            (org-set-sorting-strategy 'todo)
            (setq files (org-agenda-files nil 'ifmode)
                  rtnall nil)
            (while (setq file (pop files))
              (catch 'nextfile
                (org-check-agenda-file file)
                (setq rtn (org-agenda-get-day-entries file date :todo))
                (setq rtnall (append rtnall rtn))))
            
            (when rtnall
              (setq lucky-entry
                    (nth (random
                          (safe-length
                           (setq entries rtnall)))
                         entries))
              
              (setq marker (or (get-text-property 0 'org-marker lucky-entry)
                               (org-agenda-error)))
              (setq buffer (marker-buffer marker))
              (setq pos (marker-position marker))
              (org-pop-to-buffer-same-window buffer)
              (widen)
              (goto-char pos)
              (when (derived-mode-p 'org-mode)
                (org-show-context 'agenda)
                (save-excursion
                  (and (outline-next-heading)
                       (org-flag-heading nil))) ; show the next heading
                (when (outline-invisible-p)
                  (show-entry))         ; display invisible text
                (run-hooks 'org-agenda-after-show-hook))))))

      ;;reset subtask
      (setq org-default-properties (cons "RESET_SUBTASKS" org-default-properties))

      ;; (add-hook 'org-after-todo-state-change-hook 'org-subtask-reset)

      (setq org-plantuml-jar-path
            (expand-file-name "~/.spacemacs.d/plantuml.jar"))
      (setq org-ditaa-jar-path "~/.spacemacs.d/ditaa.jar")

      (org-babel-do-load-languages
       'org-babel-load-languages
       '((perl . t)
         (ruby . t)
         (shell . t)
         (dot . t)
         (typescript . t)
         (js . t)
         (latex .t)
         (python . t)
         (emacs-lisp . t)
         (plantuml . t)
         (C . t)
         (ditaa . t)))


      (require 'ox-md nil t)

      ;; define the refile targets
      (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
      (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
      (setq org-agenda-file-journal (expand-file-name "hey/Log.org" org-agenda-dir))
      (setq org-agenda-file-study (expand-file-name "study.org" org-agenda-dir))
      (setq org-agenda-file-trade (expand-file-name "trade.org" org-agenda-dir))
      (setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
      (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
      (setq org-agenda-file-blogposts (expand-file-name "all-posts.org" org-agenda-dir))
      (setq org-agenda-file-project (expand-file-name "project/" org-agenda-dir))
      (setq org-agenda-file-project (expand-file-name "journal/" org-agenda-dir))
      (setq org-agenda-files (list org-agenda-dir))
      (add-to-list 'org-agenda-files org-agenda-dir)
      (add-to-list 'org-agenda-files "d:/notes/journal/")
      (add-to-list 'org-agenda-files "~/notes/trade/")
      (add-to-list 'org-agenda-files "~/notes/hey/")
      (add-to-list 'org-agenda-files "~/notes/front/")
      (add-to-list 'org-agenda-files "~/notes/journal/")
      (add-to-list 'org-agenda-files "~/notes/productivity/")

      ;; org-drill 添加范围
      ;; (setq org-drill-scope directory)
      ;; C-n for the next org agenda item
      (define-key org-agenda-mode-map (kbd "C-p") 'org-agenda-previous-item)

      (with-eval-after-load 'org-agenda
        (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
        (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
          "." 'spacemacs/org-agenda-transient-state/body)
        )
      ;; the %i would copy the selected text into the template
      ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
      ;;add multi-file journal
      (setq org-capture-templates
            '(("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)
              ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
               "* %?\n  %i\n %U"
               :empty-lines 1)
              ("b" "Blog Ideas" entry (file+headline org-agenda-file-note "Blog Ideas")
               "* TODO [#B] %?\n  %i\n %U"
               :empty-lines 1)
              ("s" "Code Snippet" entry
               (file org-agenda-file-code-snippet)
               "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
              ("w" "work" entry (file+headline org-agenda-file-gtd "Work")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("c" "Chrome" entry (file+headline org-agenda-file-note "Quick notes")
               "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
               :empty-lines 1)
              ("l" "links" entry (file+headline org-agenda-file-note "Quick notes")
               "* TODO [#C] %?\n  %i\n %a \n %U"
               :empty-lines 1)
              ("f" "Study Entry"
               entry (file+datetree org-agenda-file-study)
               "* %?" :tree-type week
               :empty-lines 1)
              ("m" "Trade Entry"
               entry (file+datetree org-agenda-file-trade)
               "* %?" :tree-type week
               :empty-lines 1)
              ("j" "Journal entry" entry (function org-journal-find-location)
               "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
              ;; ("j" "Journal Entry"
              ;;  entry (file+datetree org-agenda-file-journal)
              ;;  "* %?" :tree-type week
              ;;  :empty-lines 1)
              ))

      (with-eval-after-load 'org-capture
        (defun org-hugo-new-subtree-post-capture-template ()
          "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
          (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
                 (fname (org-hugo-slug title)))
            (mapconcat #'identity
                       `(
                         ,(concat "* TODO " title)
                         ":PROPERTIES:"
                         ,(concat ":EXPORT_FILE_NAME: " fname)
                         ":END:"
                         "\n\n")        ;Place the cursor here finally
                       "\n")))

        (add-to-list 'org-capture-templates
                     '("h"              ;`org-capture' binding + h
                       "Hugo post"
                       entry
                       ;; It is assumed that below file is present in `org-directory'
                       ;; and that it has a "Blog Ideas" heading. It can even be a
                       ;; symlink pointing to the actual location of all-posts.org!
                       (file+headline org-agenda-file-blogposts "Blog Ideas")
                       (function org-hugo-new-subtree-post-capture-template))))
      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default 重要且紧急
      (setq org-agenda-custom-commands
            '(
              ("f" occur-tree "基本")
              ("c" todo "PROJECT"
               ((org-agenda-skip-function '(org-agenda-skip-subtree-if
                                            'regexp ":week:"))
                (org-agenda-overriding-header "Projects waiting for something: ")))
              ("x" agenda)
              ("b" "Blog" tags-todo "BLOG")
              ("p" . "项目安排")
              ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"work\"")
              ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"zilongshanren\"")
              ("r" "Weekly Overview" 
               ((agenda "" ((org-agenda-span 'day)
                            ;; (org-agenda-compact-blocks t)
                            ;; (org-agenda-prefix-format '((agenda . "  %?-12t")))
                            (org-super-agenda-groups
                             '((:name "Delay"
                                      :scheduled past)
                               (:name "Today"
                                      :scheduled today
                                      :order 1)
                               (:discard (:anything t))
                               ))))
                (alltodo "" ((org-agenda-overriding-header "")
                             (org-super-agenda-groups
                              '((:name "in progress"
                                       :tag "progress")
                                ))))
                ))
              ("w" "Weekly Overview1" 
               (
                (alltodo "" ((org-agenda-overriding-header "")
                             (org-super-agenda-groups
                              '((:name "week plan"
                                       :tag "weekplan")
                                (:discard (:anything t))
                                ))))
                (agenda "" ((org-agenda-span 'day)
                            ;; (org-agenda-compact-blocks t)
                            ;; (org-agenda-prefix-format '((agenda . "  %?-12t")))
                            (org-super-agenda-groups
                             '((:name "Sport"
                                      :and (:scheduled (after "2020-03-16") :tag "sport")
                                      )
                               (:name "Study"
                                      :and (:scheduled (after "2020-03-16") :tag "study")
                                      )
                               (:name "trade"
                                      :and (:scheduled (after "2020-03-16") :tag "trade")
                                      )
                               (:name "work"
                                      :and (:scheduled (after "2020-03-16") :tag "work")
                                      )
                               (:discard (:anything t))
                               ))))
                (alltodo "" ((org-agenda-overriding-header "")
                             (org-super-agenda-groups
                              '((:name "inbox"
                                       :and (:todo t :not (:tag "weekplan") ) 
                                       )
                                (:discard (:anything t))
                                ))))
                ))
              ("W" "Weekly Review"
               ((stuck "") ;; review stuck projects as designated by org-stuck-projects
                (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                ))))

      (setq spacemacs-theme-org-agenda-height nil
            org-agenda-skip-scheduled-if-done nil
            org-agenda-skip-deadline-if-done t
            org-agenda-include-deadlines t
            org-agenda-include-diary t
            org-agenda-block-separator nil
            org-agenda-compact-blocks t
            org-agenda-start-with-log-mode t)
      (org-super-agenda-mode)
      (defvar zilongshanren-website-html-preamble
        "<div class='nav'>
<ul>
<li><a href='http://zilongshanren.com'>博客</a></li>
<li><a href='/index.html'>Wiki目录</a></li>
</ul>
</div>")
      (defvar zilongshanren-website-html-blog-head
        " <link rel='stylesheet' href='css/site.css' type='text/css'/> \n
    <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/worg.css\"/>")
      (setq org-publish-project-alist
            `(
              ("blog-notes"
               :base-directory "~/org-notes"
               :base-extension "org"
               :publishing-directory "~/org-notes/public_html/"

               :recursive t
               :html-head , zilongshanren-website-html-blog-head
               :publishing-function org-html-publish-to-html
               :headline-levels 4       ; Just the default for this project.
               :auto-preamble t
               :exclude "gtd.org"
               :exclude-tags ("ol" "noexport")
               :section-numbers nil
               :html-preamble ,zilongshanren-website-html-preamble
               :author "zilongshanren"
               :email "guanghui8827@gmail.com"
               :auto-sitemap t          ; Generate sitemap.org automagically...
               :sitemap-filename "index.org" ; ... call it sitemap.org (it's the default)...
               :sitemap-title "我的wiki"     ; ... with title 'Sitemap'.
               :sitemap-sort-files anti-chronologically
               :sitemap-file-entry-format "%t" ; %d to output date, we don't need date here
               )
              ("blog-static"
               :base-directory "~/org-notes"
               :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
               :publishing-directory "~/org-notes/public_html/"
               :recursive t
               :publishing-function org-publish-attachment
               )
              ("blog" :components ("blog-notes" "blog-static"))))



      (add-hook 'org-after-todo-statistics-hook 'zilong/org-summary-todo)
      ;; used by zilong/org-clock-sum-today-by-tags

      (define-key org-mode-map (kbd "s-p") 'org-priority)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "tl" 'org-toggle-link-display)
      (define-key evil-normal-state-map (kbd "C-c C-w") 'org-refile)

      ;; hack for org headline toc
      (defun org-html-headline (headline contents info)
        "Transcode a HEADLINE element from Org to HTML.
CONTENTS holds the contents of the headline.  INFO is a plist
holding contextual information."
        (unless (org-element-property :footnote-section-p headline)
          (let* ((numberedp (org-export-numbered-headline-p headline info))
                 (numbers (org-export-get-headline-number headline info))
                 (section-number (and numbers
                                      (mapconcat #'number-to-string numbers "-")))
                 (level (+ (org-export-get-relative-level headline info)
                           (1- (plist-get info :html-toplevel-hlevel))))
                 (todo (and (plist-get info :with-todo-keywords)
                            (let ((todo (org-element-property :todo-keyword headline)))
                              (and todo (org-export-data todo info)))))
                 (todo-type (and todo (org-element-property :todo-type headline)))
                 (priority (and (plist-get info :with-priority)
                                (org-element-property :priority headline)))
                 (text (org-export-data (org-element-property :title headline) info))
                 (tags (and (plist-get info :with-tags)
                            (org-export-get-tags headline info)))
                 (full-text (funcall (plist-get info :html-format-headline-function)
                                     todo todo-type priority text tags info))
                 (contents (or contents ""))
                 (ids (delq nil
                            (list (org-element-property :CUSTOM_ID headline)
                                  (org-export-get-reference headline info)
                                  (org-element-property :ID headline))))
                 (preferred-id (car ids))
                 (extra-ids
                  (mapconcat
                   (lambda (id)
                     (org-html--anchor
                      (if (org-uuidgen-p id) (concat "ID-" id) id)
                      nil nil info))
                   (cdr ids) "")))
            (if (org-export-low-level-p headline info)
                ;; This is a deep sub-tree: export it as a list item.
                (let* ((type (if numberedp 'ordered 'unordered))
                       (itemized-body
                        (org-html-format-list-item
                         contents type nil info nil
                         (concat (org-html--anchor preferred-id nil nil info)
                                 extra-ids
                                 full-text))))
                  (concat 
                   itemized-body
                   ))
              (let ((extra-class (org-element-property :HTML_CONTAINER_CLASS headline))
                    (first-content (car (org-element-contents headline))))
                ;; Standard headline.  Export it as a section.
                (format "<%s id=\"%s\" class=\"%s\">%s%s</%s>\n"
                        (org-html--container headline info)
                        (org-export-get-reference headline info)
                        (concat (format "outline-%d" level)
                                (and extra-class " ")
                                extra-class)
                        (format "\n<h%d id=\"%s\">%s%s</h%d>\n"
                                level
                                preferred-id
                                extra-ids
                                (concat
                                 (and numberedp
                                      (format
                                       "<span class=\"section-number-%d\">%s</span> "
                                       level
                                       (mapconcat #'number-to-string numbers ".")))
                                 full-text)
                                level)
                        ;; When there is no section, pretend there is an
                        ;; empty one to get the correct <div
                        ;; class="outline-...> which is needed by
                        ;; `org-info.js'.
                        (if (eq (org-element-type first-content) 'section) contents
                          (concat (org-html-section first-content "" info) contents))
                        (org-html--container headline info))))))))))

(defun zilongshanren-org/init-org-mac-link ()
  (use-package org-mac-link
    :commands org-mac-grab-link
    :init
    (progn
      (add-hook 'org-mode-hook
                (lambda ()
                  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link))))
    :defer t))

(defun zilongshanren-org/post-init-ox-reveal ()
  (setq org-reveal-root "file:///Users/guanghui/.emacs.d/reveal-js"))


(defun zilongshanren-org/init-org-tree-slide ()
  (use-package org-tree-slide
    :init
    (spacemacs/set-leader-keys "oto" 'org-tree-slide-mode)))


(defun zilongshanren-org/init-org-download ()
  (use-package org-download
    :defer t
    :init
    (org-download-enable)))

(defun zilongshanren-org/init-plain-org-wiki ()
  (use-package plain-org-wiki
    :init
    (setq pow-directory "~/org-notes")))

(defun zilongshanren-org/init-ob-typescript ()
  (use-package ob-typescript
    :init))

(defun zilongshanren-org/init-worf ()
  (use-package worf
    :defer t
    :init
    (add-hook 'org-mode-hook 'worf-mode)))

(defun zilongshanren-org/post-init-deft ()
  (progn
    (setq deft-use-filter-string-for-filename t)
    (setq deft-recursive t)
    (setq deft-extension "org")
    (setq deft-directory deft-dir)))

(defun zilongshanren-org/init-sound-wav ()
  (use-package sound-wav
    :defer t
    :init))
;;; packages.el ends here
