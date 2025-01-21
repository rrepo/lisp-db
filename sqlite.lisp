(ql:quickload :cl-dbi)

(defvar *connection*
        (dbi:connect :sqlite3
                     :database-name "test"))

(defun get-tables ()
  (let* ((query (dbi:prepare *connection* "SELECT name FROM sqlite_master WHERE type='table';"))
         (result (dbi:execute query)))
    (dbi:fetch-all result)))

(princ (get-tables))