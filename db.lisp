(ql:quickload "mito")

(mito:connect-toplevel :postgres
                       :database-name "test"
                       :username "postgres"
                       :password "postgres")

(defun connect ()
  "Connect to the DB."
  (mito:connect-toplevel :postgres :database-name "test"))
(connect)

(mito:deftable user ()
  ((name :col-type (:varchar 64))
   (email :col-type (or (:varchar 128) :null))))

(mito.class:table-column-slots (find-class 'user))
(mito:ensure-table-exists 'user)

; (princ (mito:find-dao 'user :id 1))
; (princ (mito:retrieve-dao 'user))

(defun fetch-all-users ()
  "Retrieve all rows from the 'user' table."
  (mito:retrieve-dao 'user))

;; データを取得して出力
(let ((users (fetch-all-users)))
  (dolist (u users)
    (format t "Name: ~A, Email: ~A~%"
            (slot-value u 'name)
            (slot-value u 'email))))