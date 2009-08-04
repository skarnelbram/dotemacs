(provide 'custom-org)

(add-to-list 'load-path "~/.emacs.d/elisp/org-mode")
(require 'org-install)





     (setq org-directory "~/projs/")
     (setq org-default-notes-file "~/.notes")


 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))




;;;_ * init-org
 (add-to-list 'load-path "~/.sitelisp/org")
 (require 'org-install)

(setq org-export-publishing-directory "~/projs/.tmp")

;; ;; Patch org-mode to use vertical splitting
(defadvice org-prepare-agenda (after org-fix-split)
  (toggle-window-split))
(ad-activate 'org-prepare-agenda)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list 

;; "~/projs/academics/de/de.org"
;; "~/projs/academics/ttd_academics.org"
;; "~/projs/cal/asp.org"
;; "~/projs/cal/ttd_cal.org"
;; "~/projs/cal/cons/ttd_cons.org"
;;"~/projs/books.org"
;; "~/projs/devel/ttd_devel.org"
;; "~/projs/rkv/ttd_rkv.org"
;; "~/projs/log/ttd_log.org"
;; "~/projs/info/ttd_info.org"
;; "~/projs/info/questions.org"
;; "~/projs/scratch.org"
;; "~/projs/tasks/goals.org"
;; "~/projs/tasks/gtd.org"
;; "~/projs/tasks/home.org"
;; "~/projs/tasks/social.org"
;; "~/projs/tasks/physical.org"
;; "~/projs/tasks/mental.org"
"~/projs/home.org"
"~/projs/ttd.org"
;; "~/projs/re.org"
;;"~/projs/stu/fccj/fccj.org"
;; "~/projs/fccj.org"
;; "~/projs/tasks/ucf/ttd_ucf.org"
"~/projs/week.org"
))







;;;_  * testing


;(require 'org-export-freemind-install) 




(setq org-agenda-custom-commands
      '(("P" "Printed agenda"
         ((agenda "" ((org-agenda-ndays 7)                      ;; overview of appointments
                      (org-agenda-start-on-weekday 0)         ;; calendar begins today
                      (org-agenda-repeating-timestamp-show-all t)
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))
          (agenda "" ((org-agenda-ndays 1)                      ;; daily agenda
                      (org-deadline-warning-days 7)             ;; 7 day advanced warning for deadlines
                      (org-agenda-todo-keyword-format "[ ]")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-prefix-format "%t%s")))
          (todo "TODO"                                          ;; todos sorted by context
                ((org-agenda-prefix-format "[ ] %T: ")
                 (org-agenda-sorting-strategy '(tag-up priority-down))
                 (org-agenda-todo-keyword-format "")
                 (org-agenda-overriding-header "\nTasks by Context\n------------------\n"))))
         ( 
          (org-agenda-compact-blocks t)
          (org-agenda-remove-tags t)
          (ps-number-of-columns 2)
)
         ("~/agenda.ps"))


("o" "Printed agenda"
         ((agenda "" ((org-agenda-ndays 7)                      ;; overview of appointments
                      (org-agenda-start-on-weekday 0)         ;; calendar begins today
                      (org-agenda-repeating-timestamp-show-all t)
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))
          
          )
         ( 
          (org-agenda-compact-blocks t)
          (org-agenda-remove-tags t)
          (ps-number-of-columns 2)
)
         ("~/agenda.ps"))
        ;; other commands go here
        ))
(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)" "FAIL(f)")
 (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "OPEN(O@)" "|" "CANCELLED(c@/!)")
 (sequence "QUOTE(q!)" "QUOTED(Q!)" "|" "APPROVED(A@)" "EXPIRED(E@)" "REJECTED(R@)"))))

(setq org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
 ("STARTED" :foreground "blue" :weight bold)
 ("DONE" :foreground "green" :weight bold)
 ("FAIL" :foreground "purple" :weight bold)
 ("WAITING" :foreground "orange" :weight bold)
 ("SOMEDAY" :foreground "magenta" :weight bold)
 ("CANCELLED" :foreground "forest green" :weight bold)
 ("QUOTE" :foreground "red" :weight bold)
 ("QUOTED" :foreground "magenta" :weight bold)
 ("APPROVED" :foreground "green" :weight bold)
 ("EXPIRED" :foreground "green" :weight bold)
 ("REJECTED" :foreground "green" :weight bold)
 ("OPEN" :foreground "blue" :weight bold))))


;;Local variables:
;;allout-layout: (0 : -1 -1 0)
;;End:

