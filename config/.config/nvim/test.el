(defun persistent-scratch-buffer-identifier()
	(string-match "^*scratch:" (buffer-name)))

(defun persistent-scratch-get-scratches()
	(let ((scratch-buffers)
				(save-data
					(read
						(with-temp-buffer
							(let ((coding-system-for-read 'utf-8-unix))
								(insert-file-contents persistent-scratch-save-file))
							(buffer-string)))))
		(dolist (saved-buffer save-data)
			(push (substring (aref saved-buffer 0) (length "*scratch:")) scratch-buffers))
		scratch-buffers))

(defun persistent-scratch-quick-open()
	(interactive)
	(let* ((scratch-buffers (persistent-scratch-get-scratches))
				 (chosen-scratch (concat "*scratch:"
																 (completing-read "Choose a scratch: " scratch-buffers nil nil nil nil
																									(random-alnum 4))))
				 (buffer-exists-p (get-buffer chosen-scratch)))
		(pop-to-buffer chosen-scratch)
		(unless buffer-exists-p (persistent-scratch-restore-this))
		(persistent-scratch-mode)))
