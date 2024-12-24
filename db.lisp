(load "~/quicklisp/setup.lisp")
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

; (mito:ensure-table-exists 'user)

; (mito:create-dao 'user :name "Eitaro Fukamachi" :email "e.arrows@gmail.com")

;; count
(mito:count-dao 'user)

;; find one
(let ((user (mito:find-dao 'user :id 1)))
  (when user
        (format t "Name: ~a~%Email: ~a~%"
          (user-name user)
          (user-email user))))

;; 使用例
(format t "Connected: ~a~%" (mito.db:connected-p))
