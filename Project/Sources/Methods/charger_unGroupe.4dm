//%attributes = {}
// charger_unGroupe
// $1; $form_o: object
// $0; $form_o: object

var $0; $1; $form_o : Object
$form_o:=$1

//se déplacer dans la liste box de page  1
$form_o.posGroupeSel_i:=_f_deplacer_curseur($form_o.action; $form_o.groupe_es.length; $form_o.posGroupeSel_i)

// après mise à jour du "$form_o.groupeSel_ePos", blanchir "$form_o.action" (car utilisé dans déplacement pg2 et pg3)
$form_o.action:="MODIFIER"

If ($form_o.posGroupeSel_i>0))
	//les info sur le groupe sélectionné: pour affichage détail
	$form_o.groupe_e:=$form_o.groupe_es[$form_o.posGroupeSel_i-1]  //si position=1, alors indice=0
	$form_o.role_es:=$form_o.groupe_e.roles
	$form_o.message:="Info sur '"+$form_o.groupe_e.Nom+"'"
End if 

$0:=$form_o