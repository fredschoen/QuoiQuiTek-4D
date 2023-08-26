//%attributes = {}
//dialoguer
//$1 $form_t:text
//$2 $form_o:object
var $1; $form_t : Text
var $2; $form_o : Object

$form_t:=$1
$form_o:=$2
If (Undefined:C82($form_o.page))
	$form_o.page:=1
End if 

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675($form_t)
//MAXIMIZE WINDOW($win_l)
While ($form_o.page>0)  // 0 :quitter
	DIALOG:C40($form_t; $form_o)
End while 
CLOSE WINDOW:C154($win_l)
