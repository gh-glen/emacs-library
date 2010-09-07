;;----------------------------
;; Keep the (machine-generated) custom stuff separate.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


;;----------------------------
;; set up the load path
(setq load-path 
      (append load-path 
	      (list "~/.emacs.d/library/elisp")))        ;; general elisp


;;----------------------------
;; server mode
;(server-start)


;;------------------------------
;; Additional Packages
; org-mode
(setq org-startup-folded "showall")
(setq org-todo-keywords 
      (quote ((sequence "TODO(t!)" "WAITING(w@)" "DONE(d!)"))))


;;------------------------------
;; Set up some nice "default" behavior
(autoload 'add-autohook "autohook" "Add load hook to a package.")
(autoload 'autoloads-for-package "autohook" "Find all entry points of a package.")
;(autoload 'gnus "gnus" "The gnus NNTP news reading service" t)
(setq inhibit-startup-message t)
(setq line-move-visual nil) ; please don't foul up my macros, emacs 23!
(display-time)
(line-number-mode t)
(blink-cursor-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(or window-system (menu-bar-mode 0)) ;; only show it if we can use it
(global-font-lock-mode t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'TeX-mode-hook 'turn-on-auto-fill)


;;----------------------------
;; use diary and appt 
(setq diary-file "~/.emacs.d/diary")
; note that appt requires (display-time) to work
(add-hook 'diary-hook 'appt-make-list)
(setq appt-audible nil)
(setq appt-msg-window nil)
(diary 7)


;;----------------------------
;; rebind some keys...
(global-set-key "\b" 'delete-backward-char)
(global-set-key "\M-t" 'goto-line)
(global-set-key "\M-c" 'compile)
;(global-set-key "\C-x\C-n" 'gnus) ;;; Load GNUS and bind C-X C-N to read news


;;----------------------------
;; Make it pretty...
(set-background-color "black")
(set-foreground-color "springgreen")
(set-cursor-color "green")
;; keep it pretty
(add-to-list 'default-frame-alist '(foreground-color . "springgreen"))
;; font lock colors
(set-face-foreground 'font-lock-comment-face "CornflowerBlue")
(set-face-foreground 'font-lock-string-face "Plum")
(set-face-foreground 'font-lock-function-name-face "Yellow")
(set-face-foreground 'font-lock-keyword-face "DarkOrange")
(set-face-foreground 'font-lock-type-face "LightBlue")


;;----------------------------
;; Programming is fun
(setq compile-command "make ")

(setq auto-mode-alist
      (append '(("\\.php$"   . php-mode))
              auto-mode-alist))

;; the end.

