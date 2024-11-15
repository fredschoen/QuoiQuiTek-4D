//%attributes = {}
//charger_unRole
var $img_i : Picture

//se déplacer dans la liste box de page  1
Form:C1466.posRoleSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.role_es.length; Form:C1466.posRoleSel_i)

If (Form:C1466.posRoleSel_i>0)
	//les info sur le role sélectionné: pour affichage détail
	//-role
	Form:C1466.role_e:=Form:C1466.role_es[Form:C1466.posRoleSel_i-1]  //si position=1, alors indice=0
	//-dépendances du role
	Form:C1466.quoi_e:=Form:C1466.role_e.quoi
	
	//photo du role
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"r"+String:C10(Form:C1466.role_e.ID; "0000000")+".png"
	READ PICTURE FILE:C678($x; $img_i)
	If (OK=1)
		Form:C1466.photoRole_i:=$img_i
	Else 
		Form:C1466.photoRole_i:=Null:C1517
	End if 
	
	//photo du quoi
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"o"+String:C10(Form:C1466.role_e.quoi.ID; "0000000")+".png"
	READ PICTURE FILE:C678($x; $img_i)
	If (OK=1)
		Form:C1466.photoQuoi_i:=$img_i
	Else 
		Form:C1466.photoQuoi_i:=Null:C1517
	End if 
	
	
	
	If (Undefined:C82(Form:C1466.role_e.qui))
		//le quoi est sur un groupe
		Form:C1466.groupe_e:=Form:C1466.role_e.groupe
		Form:C1466.roleDuQuoi_es:=Form:C1466.quoi_e.roles.orderBy("groupe.Nom")
		Form:C1466.message:="'"+Form:C1466.groupe_e.Nom+"'"+" dans '"+Form:C1466.quoi_e.Nom+"' ("+String:C10(Form:C1466.quoi_e.Date)+")"
		FORM GOTO PAGE:C247(2)
	Else 
		//le quoi est sur un qui
		Form:C1466.qui_e:=Form:C1466.role_e.qui
		Form:C1466.roleDuQui_es:=Form:C1466.qui_e.roles.orderBy("quoi.Date desc")
		Form:C1466.roleDuQuoi_es:=Form:C1466.quoi_e.roles.orderBy("qui.DateNaiss")
		Form:C1466.message:="'"+Form:C1466.qui_e.FullName+"'"+" dans '"+Form:C1466.quoi_e.Nom+"' ("+String:C10(Form:C1466.quoi_e.Date)+")"
		//photo du qui
		$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"i"+String:C10(Form:C1466.qui_e.ID; "0000000")+".png"
		READ PICTURE FILE:C678($x; $img_i)
		If (OK=1)
			Form:C1466.photoQui_i:=$img_i
		Else 
			Form:C1466.photoQui_i:=Null:C1517
		End if 
		
	End if 
	
End if 
