(ql:quickload :postmodern)
(use-package :postmodern)

(defun test-postgres-connection ()
  (handler-case
      (progn
        (format t "Attempting to connect to PostgreSQL...~%")
        (connect-toplevel
         "/tmp"            ;; 空文字列でUnixソケットを利用
         "postgres"    ;; データベース名
         "postgres"    ;; ユーザー名
         "postgres"    ;; パスワード
         :port 5432)   ;; ポート番号
        (format t "Connected successfully!~%"))
    (error (e)
      (format t "Error: ~a~%" e))))

(test-postgres-connection)