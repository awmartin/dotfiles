" Vim syntax file
" Language:	fora
" Maintainer:	William Martin <william.martin@broadstreetanalytics.com>
" Updaters:	
" URL:		
" Changes:	
" Last Change:	2012 Jun 28


if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'fora'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("fora_fold")
  unlet fora_fold
endif


syn keyword foraCommentTodo      TODO FIXME XXX TBD contained
syn match   foraLineComment      "\/\/.*" contains=@Spell,foraCommentTodo
syn match   foraCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  foraComment	       start="/\*"  end="\*/" contains=@Spell,foraCommentTodo
syn match   foraSpecial	       "\\\d\d\d\|\\."
syn region  foraStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=foraSpecial,@htmlPreproc
syn region  foraStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=foraSpecial,@htmlPreproc
syn region  foraStringS
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=foraSpecial,@htmlPreproc

syn match   foraSpecialCharacter "'\\.'"
syn match   foraNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  foraRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword foraConditional	if else switch if_split
syn keyword foraRepeat		while for
syn keyword foraBranch		break skip next cached
syn keyword foraOperator	and or in is
syn keyword foraType		JOV Dictionary Vector Anything AnyConstant AnyMutable Class Tuple Integer Float PythonObject Nothing String Symbol Tag Bool Int8 Int16 Int32 Int64 UInt8 UInt16 UInt32 UInt64 Float32 Float64 DateTime TimeDuration
syn keyword foraStatement	return yield
syn keyword foraBoolean		true false
syn keyword foraNull		nothing
syn keyword foraIdentifier	self let base object class member
syn keyword foraLabel		match with filter operator
syn keyword foraException	try catch throw
"syn keyword foraMessage		
"syn keyword foraGlobal		
"syn keyword foraMember		
"syn keyword foraDeprecated	
syn keyword foraReserved	pull near split skip over of

syn match  foraSymbol		"[]})\"'`]\@<!`\%(\^\|\~\|<<\|<=>\|<=\|<\|===\|==\|=\~\|>>\|>=\|>\||\|-@\|-\|/\|\[]=\|\[]\|\*\*\|\*\|&\|%\|+@\|+\|`\)"
syn match  foraSymbol		"[]})\"'`]\@<!`\$\%(-.\|[`~<=>_,;:!?/.'"@$*\&+0]\)"
syn match  foraSymbol		"[]})\"'`]\@<!`\%(\$\|@@\=\)\=\h\w*"
syn match  foraSymbol		"[]})\"'`]\@<!`\h\w*\%([?!=]>\@!\)\="
syn match  foraSymbol		"\%([{(,]\_s*\)\@<=\l\w*[!?]\=``\@!"he=e-1
syn match  foraSymbol		"[]})\"'`]\@<!\h\w*[!?]\=`\s\@="he=e-1
"syn region foraSymbol		start="[]})\"':]\@<!:'"  end="'"  skip="\\\\\|\\'"  contains=rubyQuoteEscape fold
"syn region foraSymbol		start="[]})\"':]\@<!:\"" end="\"" skip="\\\\\|\\\"" contains=@rubyStringSpecial fold

syn match  foraTag		"[]})\"'#]\@<!#\%(\^\|\~\|<<\|<=>\|<=\|<\|===\|==\|=\~\|>>\|>=\|>\||\|-@\|-\|/\|\[]=\|\[]\|\*\*\|\*\|&\|%\|+@\|+\|`\)"
syn match  foraTag		"[]})\"'#]\@<!#\$\%(-.\|[`~<=>_,;:!?/.'"@$*\&+0]\)"
syn match  foraTag		"[]})\"'#]\@<!#\%(\$\|@@\=\)\=\h\w*"
syn match  foraTag		"[]})\"'#]\@<!#\h\w*\%([?!=]>\@!\)\="
syn match  foraTag		"\%([{(,]\_s*\)\@<=\l\w*[!?]\=##\@!"he=e-1
syn match  foraTag		"[]})\"'#]\@<!\h\w*[!?]\=#\s\@="he=e-1

if exists("fora_fold")
    syn match	foraFunction	"\<fun\>"
    syn region	foraFunctionFold	start="\<fun\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match foraSync	grouphere foraFunctionFold "\<fun\>"
    syn sync match foraSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword foraFunction	fun
    syn match	foraBraces	   "[{}\[\]]"
    syn match	foraParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "fora"
  syn sync ccomment foraComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_fora_syn_inits")
  if version < 508
    let did_fora_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink foraComment		Comment
  HiLink foraLineComment	Comment
  HiLink foraCommentTodo	Todo
  HiLink foraSpecial		Special
  HiLink foraStringS		String
  HiLink foraStringD		String
  HiLink foraCharacter		Character
  HiLink foraSpecialCharacter	foraSpecial
  HiLink foraNumber		foraValue
  HiLink foraConditional	Conditional
  HiLink foraRepeat		Repeat
  HiLink foraBranch		Conditional
  HiLink foraOperator		Operator
  HiLink foraType		Type
  HiLink foraStatement		Statement
  HiLink foraFunction		Function
  HiLink foraBraces		Function
  HiLink foraError		Error
  HiLink foraParenError		foraError
  HiLink foraNull	        Keyword
  HiLink foraBoolean		Boolean
  HiLink foraRegexpString	String

  HiLink foraIdentifier		Identifier
  HiLink foraLabel		Label
  HiLink foraException		Exception
  "HiLink foraMessage		Keyword
  "HiLink foraGlobal		Keyword
  "HiLink foraMember		Keyword
  "HiLink foraDeprecated		Exception 
  HiLink foraReserved		Keyword
  HiLink foraDebug		Debug
  HiLink foraConstant		Label
  HiLink foraSymbol             Constant
  HiLink foraTag                Constant

  delcommand HiLink
endif

let b:current_syntax = "fora"
if main_syntax == 'fora'
  unlet main_syntax
endif

" vim: ts=8
