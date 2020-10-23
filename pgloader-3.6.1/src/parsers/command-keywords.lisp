;;;
;;; Parse the pgloader commands grammar
;;;

(in-package :pgloader.parser)

;;;
;;; Keywords
;;;
(defmacro def-keyword-rule (keyword)
  (let ((rule-name (read-from-string (format nil "kw-~a" keyword)))
	(constant  (read-from-string (format nil ":~a" keyword))))
    `(defrule ,rule-name (and ignore-whitespace (~ ,keyword) ignore-whitespace)
       (:constant ',constant))))

(eval-when (:load-toplevel :compile-toplevel :execute)
  (def-keyword-rule "load")
  (def-keyword-rule "data")
  (def-keyword-rule "from")
  (def-keyword-rule "csv")
  (def-keyword-rule "dbf")
  (def-keyword-rule "ixf")
  (def-keyword-rule "fixed")
  (def-keyword-rule "copy")
  (def-keyword-rule "into")
  (def-keyword-rule "with")
  (def-keyword-rule "when")
  (def-keyword-rule "set")
  (def-keyword-rule "tablespace")
  (def-keyword-rule "database")
  (def-keyword-rule "messages")
  (def-keyword-rule "matches")
  (def-keyword-rule "in")
  (def-keyword-rule "directory")
  (def-keyword-rule "registering")
  (def-keyword-rule "cast")
  (def-keyword-rule "column")
  (def-keyword-rule "target")
  (def-keyword-rule "columns")
  (def-keyword-rule "type")
  (def-keyword-rule "extra")
  (def-keyword-rule "include")
  (def-keyword-rule "drop")
  (def-keyword-rule "not")
  (def-keyword-rule "to")
  (def-keyword-rule "no")
  (def-keyword-rule "null")
  (def-keyword-rule "default")
  (def-keyword-rule "typemod")
  (def-keyword-rule "using")
  (def-keyword-rule "on")
  (def-keyword-rule "error")
  (def-keyword-rule "stop")
  (def-keyword-rule "resume")
  (def-keyword-rule "next")
  (def-keyword-rule "parameters")
  ;; option for loading from a file
  (def-keyword-rule "workers")
  (def-keyword-rule "batch")
  (def-keyword-rule "rows")
  (def-keyword-rule "prefetch")
  (def-keyword-rule "size")
  (def-keyword-rule "concurrency")
  (def-keyword-rule "max")
  (def-keyword-rule "parallel")
  (def-keyword-rule "reject")
  (def-keyword-rule "file")
  (def-keyword-rule "log")
  (def-keyword-rule "level")
  (def-keyword-rule "encoding")
  (def-keyword-rule "timezone")
  (def-keyword-rule "decoding")
  (def-keyword-rule "truncate")
  (def-keyword-rule "disable")
  (def-keyword-rule "triggers")
  (def-keyword-rule "lines")
  (def-keyword-rule "having")
  (def-keyword-rule "fields")
  (def-keyword-rule "optionally")
  (def-keyword-rule "enclosed")
  (def-keyword-rule "by")
  (def-keyword-rule "escaped")
  (def-keyword-rule "terminated")
  (def-keyword-rule "escape")
  (def-keyword-rule "mode")
  (def-keyword-rule "nullif")
  (def-keyword-rule "blank")
  (def-keyword-rule "trim")
  (def-keyword-rule "both")
  (def-keyword-rule "left")
  (def-keyword-rule "right")
  (def-keyword-rule "whitespace")
  (def-keyword-rule "from")
  (def-keyword-rule "for")
  (def-keyword-rule "skip")
  (def-keyword-rule "header")
  (def-keyword-rule "null")
  (def-keyword-rule "if")
  (def-keyword-rule "as")
  (def-keyword-rule "blanks")
  (def-keyword-rule "date")
  (def-keyword-rule "format")
  (def-keyword-rule "keep")
  (def-keyword-rule "trim")
  (def-keyword-rule "unquoted")
  (def-keyword-rule "delimiter")
  ;; option for Citus support
  (def-keyword-rule "distribute")
  (def-keyword-rule "reference")
  ;; option for MySQL imports
  (def-keyword-rule "schema")
  (def-keyword-rule "schemas")
  (def-keyword-rule "only")
  (def-keyword-rule "drop")
  (def-keyword-rule "alter")
  (def-keyword-rule "create")
  (def-keyword-rule "rename")
  (def-keyword-rule "materialize")
  (def-keyword-rule "reset")
  (def-keyword-rule "table")
  (def-keyword-rule "name")
  (def-keyword-rule "names")
  (def-keyword-rule "tables")
  (def-keyword-rule "views")
  (def-keyword-rule "index")
  (def-keyword-rule "indexes")
  (def-keyword-rule "preserve")
  (def-keyword-rule "uniquify")
  (def-keyword-rule "sequences")
  (def-keyword-rule "foreign")
  (def-keyword-rule "keys")
  (def-keyword-rule "downcase")
  (def-keyword-rule "quote")
  (def-keyword-rule "snake_case")
  (def-keyword-rule "identifiers")
  (def-keyword-rule "including")
  (def-keyword-rule "excluding")
  (def-keyword-rule "like")
  (def-keyword-rule "multiple")
  (def-keyword-rule "single")
  (def-keyword-rule "reader")
  (def-keyword-rule "readers")
  (def-keyword-rule "per")
  (def-keyword-rule "thread")
  (def-keyword-rule "range")
  (def-keyword-rule "unsigned")
  ;; option for loading from an archive
  (def-keyword-rule "archive")
  (def-keyword-rule "before")
  (def-keyword-rule "after")
  (def-keyword-rule "finally")
  (def-keyword-rule "and")
  (def-keyword-rule "do")
  (def-keyword-rule "execute")
  (def-keyword-rule "filename")
  (def-keyword-rule "filenames")
  (def-keyword-rule "matching")
  (def-keyword-rule "first")
  (def-keyword-rule "all"))

(defrule kw-auto-increment (and "auto_increment" (* (or #\Tab #\Space)))
  (:constant :auto-increment))

(defrule kw-on-update-current-timestamp (and (~ "on update")
                                             (* (or #\Tab #\Space))
                                             (or (~ "CURRENT TIMESTAMP")
                                                 (~ "CURRENT_TIMESTAMP"))
                                             (* (or #\Tab #\Space)))
  (:constant :on-update-current-timestamp))

(defrule kw-postgresql (or (~ "pgsql") (~ "postgresql")))
(defrule kw-mysql (~ "mysql"))
(defrule kw-mssql (~ "mssql"))
