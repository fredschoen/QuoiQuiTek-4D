//%attributes = {}
// charger_unQuoi
// $1; $form_o: object
// $0; $form_o: object

var $0; $1; $form_o : Object
$form_o:=$1

//se déplacer dans la liste box de page  1
$form_o.posQuoiSel_i:=_f_deplacer_curseur($form_o.action; $form_o.quoi_es.length; $form_o.posQuoiSel_i)

// après mise à jour du "$form_o.quoiSel_ePos", blanchir "$form_o.action" (car utilisé dans déplacement pg2 et pg3)
$form_o.action:="MODIFIER"

If ($form_o.posQuoiSel_i>0))
	//les info sur le quoi sélectionné: pour affichage détail
	$form_o.quoi_e:=$form_o.quoi_es[$form_o.posQuoiSel_i-1]  //si position=1, alors indice=0
	$form_o.role_es:=$form_o.quoi_e.roles
	$form_o.message:="Info sur '"+$form_o.quoi_e.Nom+"'"
End if 

$0:=$form_o