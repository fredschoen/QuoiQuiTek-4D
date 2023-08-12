//%attributes = {}
// afficher.role_es
// $1: utilisationListe:  text

var $1 : Text
var $form_obj : Object
var $win_l : Integer

$form_obj:=New object:C1471
$form_obj.action:="INIT"  // chargement initial
$form_obj.page:=1
$form_obj.critere:=New object:C1471

//criteres d'affichage :
$form_obj.critere.role:=New object:C1471
$form_obj.critere.role.Nom:=""
$form_obj.critere.role.Genre:=""
$form_obj.critere.role.Pays:=""
$form_obj.critere.role.AnneeNaiss:=""
$form_obj.critere.role.AnneeDeces:=""
$form_obj.critere.role.Domaine:=""
$form_obj.critere.role.Style:=""
$form_obj.critere.role.Age:=""

If (Count parameters:C259>0)
	$form_obj.utilisationListe:=$1
Else 
	$form_obj.utilisationListe:=""
End if 

$win_l:=Open form window:C675("roleListe")

While ($form_obj.page>0)  // 0 :quitter
	DIALOG:C40("roleListe"; $form_obj)
End while 

CLOSE WINDOW:C154($win_l)
