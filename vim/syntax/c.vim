
"syn match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
"hi def link cCustomFunc Function

syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
hi def link cUserFunction Function

syn match cOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator "<<\|>>\|&&\|||\|++\|--\|->"
syn match cOperator "[.!~*&%<>^|=,+-]"
syn match cOperator "/[^/*=]"me=e-1
syn match cOperator "/$"
syn match cOperator "&&\|||"
hi def link cOperator Operator

