//%attributes = {}
// afficherQuiListe
// $1: type d'utilisation de la liste
var $form_o : Object
var $1 : Text
var $2 : Integer

$form_o:=New object:C1471
$form_o.action:="INIT"  // chargement initial
$form_o.page:=1

If (Count parameters:C259>0)
	$form_o.utilisationListe:=$1
Else 
	$form_o.utilisationListe:=""
End if 

//cas où on utilise la liste des quis pour ajouter un role à un quoi
If (Substring:C12($form_o.utilisationListe; 1; 8)="AJOUTER_")
	If (Count parameters:C259<2)
		ALERT:C41(Current method name:C684()+": manque $2 (quoiID_ajouterRole)")
		TRACE:C157
	Else 
		$form_o.quoiID_ajouterRole:=$2
	End if 
End if 

If ($form_o.utilisationListe="AJOUTER_POSTE")
	If (Count parameters:C259<2)
		ALERT:C41(Current method name:C684()+": manque $2 (groupeID_ajouterPoste)")
		TRACE:C157
	Else 
		$form_o.groupeID_ajouterPoste:=$2
	End if 
End if 

dialoguer("quiListe"; $form_o)
