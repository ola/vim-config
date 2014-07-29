XPTemplate priority=lang

let s:f = g:XPTfuncs()

XPTvar $TRUE          1
XPTvar $FALSE         0
XPTvar $NULL          NULL
XPTvar $UNDEFINED     NULL

XPTvar $VOID_LINE  /* void */;
XPTvar $CURSOR_PH      cursor

XPTvar $BRif          ' '
XPTvar $BRel          \n
XPTvar $BRloop        ' '
XPTvar $BRstc         ' '
XPTvar $BRfun         ' '

XPTinclude
    \ _common/common


" ========================= Function and Variables =============================

" ================================= Snippets ===================================
XPT def
def `name^ do
    `cursor^
end


XPT defimpl
defimpl `protocolName^, for: `dataType^ do
    `cursor^
end


XPT defmacro
defmacro `name^ do
    `cursor^
end


XPT defmodule
defmodule `name^ do
    `cursor^
end


XPT defp
defp `name^ do
    `cursor^
end


XPT defprotocol
defprotocol `name^, [`function^]
`cursor^


XPT defstruct
defstruct `key^: `value^


XPT @doc
@doc """
`cursor^
"""


XPT if
if `condition^ do
    `cursor^
end


XPT if,
if `condition^, do: `body^`cursor^


XPT fn
fn(`args^) -> `body^ end`cursor^


XPT @moduledoc
@moduledoc """
`cursor^
"""


XPT test
test "`name^" do
    `cursor^
end


XPT setup
setup do
    `cursor^
end
