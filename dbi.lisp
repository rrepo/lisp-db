(ql:quickload :cl-dbi)

(defvar *connection*
        (dbi:connect :postgres
                     :database-name "test"
                     :host "localhost"
                     :port 5432
                     :username "postgres"
                     :password "postgres"))

(princ *connection*)

(princ
  (dbi:fetch-all (dbi:execute 
                  (dbi:prepare *connection* "SELECT * FROM users;"))))