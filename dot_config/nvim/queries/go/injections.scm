; sql
((raw_string_literal) @sql (#contains? @sql "SELECT" "INSERT" "UPDATE" "DELETE" "CREATE" "ALTER"))

; (call_expression
;   (selector_expression
;     field: (field_identifier) @path (#eq? @path "Prepare")
;   )
;   (argument_list
;     (raw_string_literal) @sql_string
;   )
; )
