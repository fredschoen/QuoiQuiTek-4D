//%attributes = {}
// afficher.role_es

var $form_obj : Object
var $win_l : Integer

$form_obj:=New object:C1471
$form_obj.action:="INIT"  // chargement initial
$form_obj.page:=1

//criteres d'affichage :
$form_obj.critere.role_es:=New object:C1471
$form_obj.critere.role_es.Nom:=""
$form_obj.critere.role_es.Genre:=""
$form_obj.critere.role_es.Pays:=""
$form_obj.critere.role_es.AnneeNaiss:=""
$form_obj.critere.role_es.AnneeDeces:=""
$form_obj.critere.role_es.Domaine:=""
$form_obj.critere.role_es.Style:=""
$form_obj.critere.role_es.Age:=""

If (Count parameters:C259>0)
	$form_obj.utilisationListe:=$1
Else 
	$form_obj.utilisationListe:=""
End if 

$win_l:=Open form window:C675(".role_es")

While ($form_obj.page>0)  // 0 :quitter
	DIALOG:C40(".role_es"; $form_obj)
End while 

CLOSE WINDOW:C154($win_l)
