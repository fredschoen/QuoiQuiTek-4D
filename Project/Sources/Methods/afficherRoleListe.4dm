//%attributes = {}
// afficherRoleListe

var $form_obj : Object
var $win_l : Integer

$form_obj:=New object:C1471
$form_obj.action:="INIT"  // chargement initial
$form_obj.page:=1

//criteres d'affichage :
$form_obj.critereRoleListe:=New object:C1471
$form_obj.critereRoleListe.Nom:=""
$form_obj.critereRoleListe.Genre:=""
$form_obj.critereRoleListe.Pays:=""
$form_obj.critereRoleListe.AnneeNaiss:=""
$form_obj.critereRoleListe.AnneeDeces:=""
$form_obj.critereRoleListe.Domaine:=""
$form_obj.critereRoleListe.Style:=""
$form_obj.critereRoleListe.Age:=""

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
