//%attributes = {}
//mBtMaxMin
//$1 : n° fenetre
var $1 : Integer
If (Undefined:C82(Form:C1466.winMaxi_b))
	Form:C1466.winMaxi_b:=True:C214
End if 

If (Form:C1466.winMaxi_b)
	MINIMIZE WINDOW:C454($1)
Else 
	MAXIMIZE WINDOW:C453($1)
End if 

Form:C1466.winMaxi_b:=(Not:C34(Form:C1466.winMaxi_b))