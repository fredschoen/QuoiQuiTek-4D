//%attributes = {}
// _f_pourSelectionner
// $1; $formEventCode : Integer
// $2; $sel_o : Object
// $0; $pourSelectionner_b: Boolean

var $1; $formEventCode : Integer
var $2; $sel_o : Object
var $0; $pourSelectionner_b : Boolean

$formEventCode:=$1
$sel_o:=$2

Case of 
	: ($formEventCode=On After Keystroke:K2:26)  // pour ne pas obliger à utiliser la souris 
		//(todo: comment détecter la frappe de "enter" dans la listebox)
		C_LONGINT:C283($frappe)
		$frappe:=Character code:C91(Keystroke:C390)
		If ($frappe=Right arrow key:K12:17)
			$pourSelectionner_b:=True:C214
		End if 
	: ($formEventCode=On Clicked:K2:4)  // "ON Double Clicked" inutile : "On Clicked" détecté avant )
		$pourSelectionner_b:=True:C214
	Else 
		$pourSelectionner_b:=False:C215
End case 

If ($pourSelectionner_b)
	$pourSelectionner_b:=($sel_o#Null:C1517)
End if 

$0:=$pourSelectionner_b