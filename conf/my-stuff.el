;;; my-stuff.el --- My stuff

;;; Commentary:
;; 

;;; Code:

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(defalias 'list-buffers 'ibuffer)
(ido-mode 1)

(defun select-and-activate-window (window)
  "select window and make frame active"
  (interactive)
  (select-window window)
  (select-frame-set-input-focus (window-frame window)))

(defun go-next-thing ()
  "command for 'next'"
  (interactive)
  (select-and-activate-window (next-window nil nil t)))

(defun go-prev-thing ()
  "command for 'prev'"
  (interactive)
  (select-and-activate-window (get-lru-window t)))

(global-set-key (kbd "<s-up>") 'ido-switch-buffer)
(global-set-key (kbd "<s-left>") 'switch-to-next-buffer)
(global-set-key (kbd "<s-right>") 'switch-to-prev-buffer)

(global-set-key (kbd "s-]") 'go-next-thing)
(global-set-key (kbd "s-[") 'go-prev-thing)

(defmacro set-s-num-key (num)
  "set s-<num> key to select nth window"
  `(global-set-key 
    (kbd ,(format "s-%d" num)) 
    (lambda ()
      (interactive)
      (let ((window-to-select (nth ,num (window-list))))
	(when (window-live-p window-to-select)
	  (select-window window-to-select))))))

(set-s-num-key 1)
(set-s-num-key 2)
(set-s-num-key 3)


;;; my-stuff.el ends here
