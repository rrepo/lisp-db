(load "~/quicklisp/setup.lisp")
(ql:quickload "CL-DBI")

;; データベースに接続
(defvar *connection*
        (dbi:connect :postgres
                     :database-name "test"
                     :username "postgres"
                     :password "postgres"))

;; クエリを準備
(let ((query (dbi:prepare *connection* "SELECT * FROM \"user\"")))
  ;; クエリを実行して結果を取得
  (let ((result (dbi:execute query)))
    ;; 結果をフェッチ
    (let ((rows (dbi:fetch result)))
      ;; 結果を表示
      (format t "~{~A~%~}" rows))))


(let* ((query (dbi:prepare *connection* "SELECT id, name, email, created_at, updated_at FROM \"user\""))
       (result (dbi:execute query)))
  ;; カラム名を手動で指定
  (let ((columns '("id" "name" "email" "created_at" "updated_at")))
    ;; 結果をフェッチ
    (loop for row = (dbi:fetch result)
          while row
          do (loop for column in columns
                   for value in row
                   do (format t "~A: ~A~%" column value))
            (format t "---~%"))))
