;;; -*- lexical-binding: t; -*-

(defun sql-find-sqli-buffer (&optional product connection)
  "Returns the name of the current default SQLi buffer or nil.
In order to qualify, the SQLi buffer must be alive, be in
`sql-interactive-mode' and have a process."
  (let ((buf  sql-buffer)
        (prod (or product sql-product)))
    (or
     ;; Current sql-buffer, if there is one.
     (and (sql-buffer-live-p buf prod connection)
          buf)
     ;; Global sql-buffer
     (and (setq buf (default-value 'sql-buffer))
          (sql-buffer-live-p buf prod connection)
          buf)
     ;; Look thru each buffer
     (car (apply 'append
                 (mapcar (lambda (b)
                           (and (sql-buffer-live-p b prod connection)
                                (list (buffer-name b))))
                         (buffer-list)))))))

(setq sql-postgres-login-params
      '((user :default "postgres")
	(database :default "postgres")
	(server :default "/var/run/postgresql")
	(port :default 5432)))

;;; sql.el ends here
