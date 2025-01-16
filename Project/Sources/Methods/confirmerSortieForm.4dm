//%attributes = {}
//confirmerSortieForm
// $1: message
var $txt : Text

If (Form event code:C388#On Unload:K2:2)
	return 
End if 

//If (Count parameters>1)
//$txt:=$1
//Else 
//$txt:="sortir du formulaire ?"
//End if 
//CONFIRM($txt)
//If (OK=1)
Form:C1466.page:=0
CANCEL:C270
//End if 

