//%attributes = {}
//charger_unRole
// $1; $form_o: object
// $0; $form_o: object
$form_o:=$1
//se déplacer dans la liste box de page  1
$form_o.posRoleSel_i:=_f_deplacer_curseur($form_o.action; $form_o.role_es.length; $form_o.posRoleSel_i)

// après mise à jour du "$form_o.eleCou...Pos", blanchir "$form_o.action" (car utilisé dans déplacement pg2 et pg3)
$form_o.action:="MODIFIER"

If ($form_o.posRoleSel_i>0)
	//les info sur le role sélectionné: pour affichage détail
	//-role
	$form_o.role_e:=$form_o.role_es[$form_o.posRoleSel_i-1]  //si position=1, alors indice=0
	//-dépendances du role
	$form_o.qui_e:=$form_o.role_e.qui
	$form_o.quoi_e:=$form_o.role_e.quoi
	$form_o.rolesDuQui_es:=$form_o.qui_e.roles
	$form_o.rolesDuQuoi_es:=$form_o.quoi_e.roles
	$form_o.message:="Info sur le role de '"+$form_o.qui_e.Nom+"'"+" dans '"+$form_o.quoi_e.Nom+"'"
End if 
$0:=$form_o