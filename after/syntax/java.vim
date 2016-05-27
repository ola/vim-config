if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match javaNiceOperator "->" conceal cchar=→

hi link javaNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
