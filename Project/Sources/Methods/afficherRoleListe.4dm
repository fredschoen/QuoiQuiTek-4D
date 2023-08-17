//%attributes = {}
// afficher.role_es
// $1: utilisationListe:  text

var $1 : Text
var $form_o : Object
var $win_l : Integer

$form_o:=New object:C1471
$form_o.action:="INIT"  // chargement initial
$form_o.page:=1
$form_o.critere:=New object:C1471

//criteres d'affichage :
$form_o.critere.role:=New object:C1471
$form_o.critere.role.Nom:=""
$form_o.critere.role.Genre:=""
$form_o.critere.role.Pays:=""
$form_o.critere.role.DateNaiss:=""
$form_o.critere.role.DateDeces:=""
$form_o.critere.role.Domaine:=""
$form_o.critere.role.Style:=""
$form_o.critere.role.Age:=""

If (Count parameters:C259>0)
	$form_o.utilisationListe:=$1
Else 
	$form_o.utilisationListe:=""
End if 

dialoguer("roleListe"; $form_o)