//%attributes = {}
// afficherGroupeListe
// $1: utilisationListe:  text

var $1 : Text
var $form_o : Object
var $win_l : Integer

$form_o:=New object:C1471
$form_o.action:="INIT"  // chargement initial
$form_o.page:=1
$form_o.critere:=New object:C1471

If (Count parameters:C259>0)
	$form_o.utilisationListe:=$1
Else 
	$form_o.utilisationListe:=""
End if 

dialoguer("groupeListe"; $form_o)