if exists('g:no_scala_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match scalaNiceOperator "=>" conceal cchar=→

hi link scalaNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
