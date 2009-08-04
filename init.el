;; -*- emacs-lisp -*-
;; Time-stamp: <2009-08-03 23:26:59 user>
;; (add-to-list 'load-path "~/.emacs.d/plugins")
(setq load-path (append (list "/usr/local/share/emacs/site-lisp/apel") load-path))

(setq custom-file "~/.emacs.d/custom-emacs")
(load custom-file)

;; (add-to-list 'load-path "~/.sitelisp/new")

;;;_ * . Thumper_ @  http://doc.norang.ca/org-mode.html
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/yasnippet"))

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; Make TAB the yas trigger key in the org-mode-hook and turn on flyspell mode
(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet
			(make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)
            ;; flyspell mode to spell check everywhere
            (flyspell-mode 1)))










;; (if (eq window-system 'x)
;;     (shell-command "xmodmap -e 'clear Lock' -e 'keycode 66 = F13'"))
;; (global-set-key [f13] 'execute-extended-command)

;;;_ * Accessibility – how Emacs makes a computer more accessible
;;;_ * BufferSwitching – switching among different buffers
;;;_ * Commands – defining and running Emacs commands
;;;_ * Completion – completing text in the minibuffer or other buffers
;;;_ * Customize – customizing Emacs
;;;_   * Display 
;; 		(require 'buff-menu+)

;;;_    [ line-to-top-of-window ]
		(defun line-to-top-of-window ()
		"Move the line point is on to top of window."
		(interactive) 
		(recenter 5))
		(global-set-key [f6] 'line-to-top-of-window)

;;;_    [ rotate-buffers ]
		(autoload 'stesla-rotate-buffers "rotate-buffers")
		(global-set-key [(f11)]        'stesla-rotate-buffers)
		(global-set-key [(f12)]       (lambda ()
		 	(interactive)
			(stesla-rotate-buffers -1)))

;;;_       + Faces 
;;;_       + Frames – frames (window-manager windows).
;;;_       + Keys 
;;;_             + Mouse – using a mouse with Emacs
;;;_       + Paths – specifying OS paths used by Emacs
;;;_       + Persistence – saving state between Emacs sessions
;;;_       + Windows – Emacs windows (panes within a frame)
;;;_ * Editing 
;;;_       + Filling – filling, justifying, wrapping text
;;;_       + Indentation – indenting text, including code
;;;_       + Parentheses – showing parenthesis matches and mismatches
;;;_       + Region – selecting text and acting on it
;;;_       + Spelling – spell-checking
;;;_       + Templates
;;;_       + Undo – undoing and redoing changes
;;;_ * Files – files and directories: local, remote, backup
;;;_       + Directories – Dired: 
;;;_ * HideStuff – hiding parts of a buffer
;;;_       + Outline 
;;;_ * Modes – Emacs modes not listed separately here
;;;_       + Hypermedia 
;;;_       + Sql 
;;;_       + Tables 
;;;_       + Tex 
;;;_       + XML 
;;;_ * Menus – Emacs menus (menu bar, pop-up)
;;;_       + Mouse – using a mouse with Emacs
;;;_ * Printing – printing files, buffers, regions
;;;_ * Programming – using Emacs in programming



;;;_   [ auto executable ]
		(defun make-shell-scripts-executable (&optional filename)
	        (setq filename (or filename (buffer-name)))
	        (unless (or (not (string-match "\.sh$\\|\.pl$" filename))
	            (file-executable-p filename))
				(set-file-modes filename 493)
    	    (message "Made %s executable" filename)))
	    (add-hook 'after-save-hook 'make-shell-scripts-executable)

;;;_   [ comment and go ] 
		(defun comment-and-go-down (arg)
			"Comments and goes down ARG lines."
			(interactive "p")
			(condition-case nil
				(comment-region (point-at-bol) (point-at-eol)) (error nil))
				(next-line 1)
				(if (> arg 1) (comment-and-go-down (1- arg))))

		(defun uncomment-and-go-up (arg)
			"Uncomments and goes up ARG lines."
			(interactive "p")
			(condition-case nil
				(uncomment-region (point-at-bol) (point-at-eol)) (error nil))
				(next-line -1)
				(if (> arg 1) (uncomment-and-go-up (1- arg))))

		(global-set-key  [(control <)] 'comment-and-go-down)
		(global-set-key  [(control >)] 'uncomment-and-go-up)

;;;_ * Regexp – defining and using regular expressions
;;;_ * SearchAndReplace - searching and replacing, including regexp search
;;;_ * Writing – using Emacs and other tools to write
;;;_ * BatchMode – EmacsLisp as a scripting language
;;;_ * Calculators – math operations
;;;_       + Financial – money management and accounting
;;;_ * Calendar – calendar, diary, task (appointment) reminders
;;;_       + Todo – creating and using to-do lists
;;;_       + TimeTracking – tracking your time
;;;_ * Education – tools for educating students
;;;_ * ExternalUtilities – using external utilities (except for programming
;;;_       + Cryptography – encrypting and decrypting files you edit
;;;_       + Shell – using a shell
;;;_       + Eshell – a shell implemented in EmacsLisp
;;;_       + VersionControl –
;;;_ * Games – playing
;;;_ * Interface – accessing online utilities
;;;_       + ChatClient – chatting
;;;_       + Journaling – accessing Web logs (blogs)
;;;_ * Mail – Emacs mail clients
;;;_       + Gnus – an Emacs reader of news and mail
;;;_       + MailAddons – mail-handling add-ons (not Gnus-related).
;;;_ * PersonalInformationManager – PIM functionalities
;;;_       + Bbdb 
;;;_ * ProgrammerUtils – programmer tools, such as code browsers
;;;_ * Related 
;;;_ * RemoteEmacs – running Emacs on a remote host
;;;_ * WebBrowser – browsing Web files and sites

(require 'time-stamp)      (add-hook 'before-save-hook 'time-stamp)

(add-to-list 'load-path "~/.emacs.d/plugins")
    (require 'custom-org)
    (require 'custom-rem)
;;     (require 'custom-bbdb)
;;     (require 'custom-emms)
;;     (require 'custom-w3m)
;;     (require 'custom-dired)
;;     (require 'custom-testing)

;; ;;;_ + msf-abbvev
;;  (setq-default abbrev-mode t) ;; ensure abbrev mode is always on
;;  (setq save-abbrevs nil) ;; do not bug me about saving my abbreviations
;;  (require 'cc-mode)
;;  (require 'cperl-mode)
;;  (require 'sh-script)
;;  (require 'shell)
;;  (require 'tex-site) 
;;  (require 'msf-abbrev)
;;  (setq msf-abbrev-verbose t) ;; optional
;;  (setq msf-abbrev-root "~/.sitelisp/mode-abbrevs")
;;  (global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
;;  (global-set-key (kbd "C-c A") 'msf-abbrev-define-new-abbrev-this-mode)
;;  (msf-abbrev-load)

;;;_   [ auctex ]
;; 		(add-to-list 'load-path "~/.sitelisp/auctex")
;; 		(load "auctex.el" nil t t)
;; 		(load "preview-latex.el" nil t t)

;;;_   [ mathematica ]
;; 		(autoload 'math "math" "Starts Mathematica" t)
;; 		(autoload 'math-mode "math" 
;; 		"Mode for editing Mathematica.  Loading will result in more info." t)

;;;_    [ gplot ]
;; 		(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
;; 		(autoload 'gnuplot-make-buffer "gnuplot" 
;; 			"open a buffer in gnuplot mode" t)
;; 		(setq auto-mode-alist 
;; 			(append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
;; 		(setq auto-mode-alist 
;; 			(append '(("\\.gpi$" . gnuplot-mode)) auto-mode-alist))


;;  (add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))
;;     (autoload 'perltidy "perltidy-mode" nil t)
;;     (autoload 'perltidy-mode "perltidy-mode" nil t)
;;     (eval-after-load "cperl-mode"
;;     '(add-hook 'cperl-mode-hook 'perltidy-mode))
;;     (global-set-key "\C-ct" 'perltidy)

;;     (require 'psvn)

;;  (define-key global-map [S-down-mouse-1] nil) ;; Get rid of `mouse-set-font':
;;      (autoload 'alt-mouse-set-font "alt-font-menu"
;;      "interactively choose font using mouse" t)
;;      (global-set-key [(shift down-mouse-3)] 'alt-mouse-set-font)

;;  (require 'show-wspace) 


;;   hide tool bar until you ask for it
  (require 'tool-bar+) 
    (require 'tool-bar+)
    (tool-bar-pop-up-mode 1)

  ;; show line numbers and column numbers on status line.
  (setq-default line-number-mode t
          column-number-mode t)


    ;convert a buffer from dos ^M end of lines to unix end of lines
    (defun dos2unix ()
        (interactive)
        (goto-char (point-min))
    (while (search-forward "\r" nil t) (replace-match "")))

    ;vice versa
    (defun unix2dos ()
        (interactive)
        (goto-char (point-min))
        (while (search-forward "\n" nil t) (replace-match "\r\n")))

    (require 'func-doc)
    (setq func-doc-split-window t)

    (require 'uniquify) (setq uniquify-buffer-name-style 'post-forward-angle-brackets)  



    (autoload 'longlines-mode
        "longlines.el"
        "Minor mode for automatically wrapping long lines." t)
        (global-set-key (kbd "C-c q") 'longlines-mode)



        (global-set-key (kbd "C-c \\") 'indent-region)



(require 'allout)
(allout-init t)
(add-to-list 'auto-mode-alist '("\\.el$" . allout-mode))
(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))

;;    (require 'color-theme)




(global-set-key (kbd "M-n") 'scroll-up)
(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'gnus)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
(global-set-key [f5] 'new-frame)
(defun yes-or-no-p (prompt)
  "replace tedious yes/no+enter with y/n keypress"
  (y-or-n-p prompt))
		
;;;_  + parent-minibuffer
    (defun parent-minibuffer () ;; When in the minibuffer M-backspace removes the current content and put "~/" 
        "Remove one level of '/' in the minibuffer."
        (interactive)
        (save-excursion
        (goto-char (point-min))
        (cond
            ((re-search-forward "[/]+[^/]+[/]+$" nil t) (replace-match "/"))
            ((re-search-forward "\ ~/$" nil t) (replace-match "/"))
            ((re-search-forward "\ /$" nil t) (replace-match "~/"))
    )))
    (define-key
        minibuffer-local-completion-map [(meta backspace)] 'parent-minibuffer)
    (define-key
        minibuffer-local-must-match-map [(meta backspace)] 'parent-minibuffer)


;;;_  + autosave

;;  Put autosave files (ie #foo#) in one place, *not* scattered all over the
;;  file system! (The make-autosave-file-name function is invoked to determine
;;  the filename of an autosave file.)
 (defvar autosave-dir (concat "/home/" (user-login-name) "/.emacs.d/autosave/"))
 (make-directory autosave-dir t)

 (defun auto-save-file-name-p (filename) (string-match "^#.*#$" (file-name-nondirectory filename)))

 (defun make-auto-save-file-name () (concat autosave-dir (if buffer-file-name (concat "#" (file-name-nondirectory buffer-file-name) "#") (expand-file-name (concat "#%" (buffer-name) "#")))))

 ;; Put backup files (ie foo~) in one place too. (The backup-directory-alist 
 ;; list contains regexp=>directory mappings; filenames matching a regexp are 
 ;; backed up in the corresponding directory. Emacs will mkdir it if necessary.) 
 (defvar backup-dir (concat "/home/"  (user-login-name) "/.emacs.d/backup/")) (setq backup-directory-alist (list (cons "." backup-dir)))





;; (if (file-directory-p "~/.backup")
;; 	(setq backup-directory-alist '(("." . "~/.backup")))
;;   (message "Directory does not exist: ~/.backup"))

(setq backup-by-copying t	 ; Don't delink hardlinks
	  delete-old-versions t	 ; Clean up the backups
	  version-control t		 ; Use version numbers on backups,
	  kept-new-versions 30	  ; keep some new versions
	  kept-old-versions 20)	  ; and some old ones, too




    (autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
    (setq flyspell-doublon-as-error-flag nil)
    (global-set-key (kbd "<C-M-;>")   'flyspell-auto-correct-word)


   (autoload 'mthesaur-search "mthesaur"
     "Thesaurus lookup of a word or phrase." t)
   (autoload 'mthesaur-search-append "mthesaur"
     "Thesaurus lookup of a word or phrase, append results." t)

   (global-set-key "\C-ct" 'mthesaur-search)
   (global-set-key "\C-c\C-t" 'mthesaur-search-append)

    (require 'zone)
    (require 'solitaire)
    (require 'life)
;; 

    
;; (setq load-path (append (list "sp") load-path))


;;;_    [ ebibrc ]
;; (load "ebibrc")
;; (global-set-key "\C-ce" 'ebib)   

;; (defun map-keys (alist)
;;   "map-keys ALIST \nAutomates mapping of keys using an alist.
;; cdr of each pair (command) should not be quoted."
;;   (dolist (key-cons alist)
;;     (cond ((or (null (car key-cons))
;; 	       (null (nth 1 key-cons)))
;; 	   nil)
;; 	  ((not (functionp (nth 1 key-cons)))
;; 	   nil)
;; 	  (t (global-set-key (car key-cons) (nth 1 key-cons))))))
;; (setq map-keys-alist
;;       '(
;; ("\M-D" backward-kill-word)	
;; 	("\M-U" backward-capitalize)
;; ;; 	("\C-h" backward-delete-char)	
;; 	("\C-cv" bbdb-complete-name)
;; 	("\C-x\C-a" find-file-other-frame)
;; 	("\C-x\C-z" delete-frame) 




  (global-set-key "\C-cn" 'next-error)	
  (global-set-key "\C-c\C-a" 'mark-whole-buffer)
  (global-set-key "\C-cp" 'previous-error) 

;;Local variables:
;;allout-layout: (0 : -1 -1 0)
;;End:

  (global-set-key [(f4)] 'bookmark-bmenu-list)

 (require 'auto-install)
 (setq auto-install-directory "~/.emacs.d/auto-install/")



;; (add-to-list 'load-path "~/.sitelisp/mldonkey")
;;    (require 'mldonkey)
;;    (setq mldonkey-host "localhost")
;;    (setq mldonkey-port 4000)


;;  (require 'linkd)
;; (setq linkd-use-icons t)
;; (setq linkd-icons-directory "/home/user/.emacs.d/icons")

;;  (global-set-key [(control \&)] 'linkd-follow-on-this-line)
;;  (global-set-key [(control f3)] 'linkd-process-block)
;;  (global-set-key (kbd "M-[") 'linkd-previous-link)
;;  (global-set-key (kbd "M-]") 'linkd-next-link)
;;  (global-set-key (kbd "M-RET") 'linkd-follow-at-point)


;; (eval-after-load 'w3m
;;   '(progn
;;      (define-key w3m-mode-map "q" 'w3m-previous-buffer)
;;      (define-key w3m-mode-map "w" 'w3m-next-buffer)
;;      (define-key w3m-mode-map "x" 'w3m-close-window)))




;;;_  * mew
;; (add-to-list 'load-path "~/.sitelisp/mew")

;;      (autoload 'mew "mew" nil t)
;;      (autoload 'mew-send "mew" nil t)

;;  (setq mew-name "43%sandery.org") ;; (user-full-name)
;;  (setq mew-user "43%sandery.org") ;; (user-login-name)
;;  (setq mew-mail-domain "sandery.org")
;;  (setq mew-pop-user "43%sandery.org")  ;; (user-login-name)
;;  (setq mew-pop-server "mail.sandery.org")    ;; if not localhost



;;;_  * phpmode
;;      (add-to-list 'load-path "/home/user/.emacs.d/elisp")
     (load "php-mode")
     (add-to-list 'auto-mode-alist
     	     '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
     (add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
     (add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))


;;;_  * emacs23 
(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 3) (+ oldalpha 3))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

;; _    [ elscreen ]
;; 		(require 'elscreen)
;; 		(require 'elscreen-w3m)
;; 		(require 'elscreen-color-theme)
;; 		(require 'elscreen-dired)
;; 		(require 'elscreen-dnd)
;; 		(require 'elscreen-howm)
;; 		(require 'elscreen-server)
;; 		(require 'elscreen-speedbar)
;; 		(global-set-key (kbd "C-z C-z") 'advertised-undo)



(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))
