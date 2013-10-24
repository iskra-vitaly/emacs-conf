(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'inferior-octave-mode-hook
	  (lambda ()
	    (turn-on-font-lock)))
