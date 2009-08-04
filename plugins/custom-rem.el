(provide 'custom-rem)




;;;_ * remember

;;  (add-to-list 'load-path "~/.sitelisp/remember")
;; (require 'remember-autoloads)
;; (autoload 'remember "remember" nil t)
;; (autoload 'remember-region "remember" nil t)
;; (define-key global-map [f9] 'remember-clipboard)

(require 'org-remember)
     (setq remember-annotation-functions '(org-remember-annotation))
     (setq remember-handler-functions '(org-remember-handler))
     (add-hook 'remember-mode-hook 'org-remember-apply-template)

(define-key global-map [f8] 'org-remember)
;; (define-key global-map [s-f8] 'remember-region)



;;;_  * remember forms
(setq org-remember-templates
'(
(?p "* Password %?\n  %T
Where: %^{where}
Who: %^{who}\n
Password: %^{password}\n
" "~/projs/passwords.gpg" "Password")


(?t "* TODO %?\n  %T" "~/projs/ttd.org" "Tasks")

(?w "* IDEA %?\n  %T" "~/projs/ttd.org" "Tasks")
(?z "* IDEA %?\n  %T" "~/projs/notes/blog.org" "Tasks")

(?i "* Idea %T\n %i \n Where is it from: %^{origin}\n Why do I like it: %^{value} \n\n "  "~/projs/notes/ideas.org")

        (?j "*	%T %? \n\n " "~/projs/log/journal.org"  )
        (?l "*	%T %? \n\n " "~/projs/log/log.org")
        (?w "%:w3m %:url")

         (?q "* Quote %T\n %x \n Where is it from: %^{origin}\n Why do I like it: %^{value} \n\n " "~/projs/notes/quotes.org")


;;;_  * burns
(?b "* bdc %T 
| # | Has Troubled You  | 0-3|
| # | Sadness?			|  %^{sadness}|
| # | Discouragement?	|  %^{discouragement}|
| # | Poor Self-Esteem? |  %^{poor self esteem}|
| # | Inferiority?		|  %^{inferiority}|
| # | Guilt?			|  %^{guilt}|
| # | Indecisiveness?	|  %^{indecisiveness}|
| # | Frustration?		|  %^{frustration}|
| # | Apathy?			|  %^{apathy}|
| # | Motivationless?	|  %^{motivationless}|
| # | Poor self-image?	|  %^{poor self image}|
| # | Appetite extremes?|  %^{appetite}|
| # | Sleep extremes?	|  %^{sleep}|
| # | Libidoless?		|  %^{libidoless}|
| # | Hypocondria?		|  %^{hypocondria}|
| # | Ideations?		|  %^{ideations}|
|#|||
#+TBLFM: @17$3=vsum(@3..@16);



" "~/projs/log/burns.org" )

(?a
"* bai %T
|-|
| Anxiety, nervousness, worry, or fear. | %^{Anxiety, nervousness, worry, or fear.}|
| Feeling that things around you are strange or unreal. | %^{Feeling that things around you are strange or unreal.}|
| Feeling detached from all or part of your body. | %^{Feeling detached from all or part of your body.}|
| Sudden unexpected panic spells. | %^{Sudden unexpected panic spells.}|
| Apprehension or a sense of impending doom. | %^{Apprehension or a sense of impending doom.}|
| Feeling tense, stressed, uptight, or on edge. |%^{Feeling tense, stressed, uptight, or on edge.}
| Difficulty concentrating. | %^{Difficulty concentrating.}|
| Racing thoughts. | %^{Racing thoughts.}|
| Frightening fantasies or daydreams. | %^{Frightening fantasies or daydreams.}|
| Feeling that you are on the verge of losing control. | %^{Feeling that you are on the verge of losing control.}|
| Fears of cracking up or going crazy. | %^{Fears of cracking up or going crazy.}|
| Fears of fainting or passing out. |%^{Fears of fainting or passing out.}|
| Fears of physical illnesses or heart attacks or dying. |%^{Fears of physical illnesses or heart attacks or dying.}|
| Concerns about looking foolish or inadequate. |%^{Concerns about looking foolish or inadequate.}|
| Fears of being alone, isolated, or abandoned. |%^{Fears of being alone, isolated, or abandoned.}|
| Fears of criticism or disapproval. |%^{Fears of criticism or disapproval.}|
| Fears that something terrible is about to happen. |%^{Fears that something terrible is about to happen.}|
| Skipping, racing, or pounding of the heart. |%^{Skipping, racing, or pounding of the heart.}|
| Pain, pressure, or tightness in the chest. |%^{Pain, pressure, or tightness in the chest.}|
| Tingling or numbness in the toes or fingers. |%^{Tingling or numbness in the toes or fingers.}|
| Butterflies or discomfort in the stomach. |%^{Butterflies or discomfort in the stomach.}|
| Constipation or diarrhea. |%^{Constipation or diarrhea.}|
| Restlessness or jumpiness. |%^{Restlessness or jumpiness.}|
| Tight, tense muscles. |%^{Tight, tense muscles.}|
| Sweating not brought on by heat. |%^{Sweating not brought on by heat.}|
| A lump in the throat. |%^{A lump in the throat.}|
| Trembling or shaking. |%^{Trembling or shaking.}|
| Rubbery legs. |%^{Rubbery legs.}|
| Feeling dizzy, lightheaded or off balance. | %^{Feeling dizzy, lightheaded or off balance.}|
| Choking or smothering sensations or difficulty breathing. | %^{Choking or smothering sensations or difficulty breathing.}|
| Headaches or pains in the neck or back. | %^{Headaches or pains in the neck or back.}| 
| Hot flashes or cold chills. |%^{Hot flashes or cold chills.}|
| Feeling tired, weak, or easily exhausted. | %^{Feeling tired, weak, or easily exhausted.}|
|-----------------------------------------------------------+-----|
|                                                           |     |
#+TBLFM: @35$2=vsum(@1..@34);N

" "~/projs/log/burns.org" )

;;        (?1
;; "* %T Emotion Cost-Benefit Analysis

;; Describe Negative Feelings:  %?

;;    |Advantages to Feeling This way|Disadvantages of Feeling This Way|
;;    |-
;;    |%^{A}|%^{D}|
;;    |-
;;    |%^{As}|%^{Ds}|
;; "

;; "~/projs/log/dml.org"

;; )

;;        (?2
;; "* %T Exime the Evidence

;; Describe Negative Feelings:  %?

;;    |Advantages to Feeling This way|Disadvantages of Feeling This Way|
;;    |-
;;    |%^{A}|%^{D}|
;;    |-
;;    |%^{As}|%^{Ds}|
;; "

;; "~/projs/log/dml.org"

;; )

;; "* %T Daily Mood Log
;;    %^{A}
 
;; 	|Negative Thoughts(Belief)|Distortions|Positive Thoughts(Belief)|
;; 	|-
;; 	|%^{NT} |%^{D}|%^{PT} |
;; 	|-
 
;; "
;; "~/projs/log/dml.org"

)

)
 (setq org-reverse-note-order t)

    (dolist (hook '(org-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1)))
;;     (add-hook hook (lambda () (longlines-mode 1)))
 )

 
(load "~/src/org-mode/contrib/lisp/org-exp-blocks")
(setq org-ditaa-jar-path "~/bin/ditaa0_6b.jar")


;;Local variables:
;;allout-layout: (0 : -1 -1 0)
;;End:
