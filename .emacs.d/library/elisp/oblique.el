(require 'cookie1)

(defcustom oblique-file "~/.emacs.d/library/misc/oblique.lines"
  "File containing oblique strategies."
  :type 'file)

(defconst oblique-load-message "shuffling the deck...")
(defconst oblique-after-load-message "deck shuffled")

;;;###autoload
(defun oblique (&optional insert)
  "Return or display a random oblique strategy.  With prefix arg, insert it."
  (interactive "P")
  (let ((oblique (cookie oblique-file 
			 oblique-load-message 
			 oblique-after-load-message)))
    (cond (insert
	   (insert oblique))
	  ((not (interactive-p))
	   oblique)
	  ((not (string-match "\n" oblique))
	   (delete-windows-on (get-buffer-create "*Help*"))
	   (message "%s" oblique))
	  (t
	   (message "Oblique Strategies")
	   (with-output-to-temp-buffer "*Help*"
	     (princ oblique)
	     (save-excursion
	       (set-buffer standard-output)
	       (help-mode)))))))

(provide 'oblique)

;;; oblique.el ends here
