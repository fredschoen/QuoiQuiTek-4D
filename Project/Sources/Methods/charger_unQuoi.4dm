//%attributes = {}
// charger_unQuoi
var $img_i : Picture


If (Form:C1466.action="AJOUTER")
	Form:C1466.quoi_e:=ds:C1482.Quoi.new()
	Form:C1466.quoi_es:=ds:C1482.Quoi.newSelection()  // l'entitySelection sera altérable (.add)
Else 
	//les info sur le quoi sélectionné: pour affichage détail
	Form:C1466.quoi_e:=Form:C1466.quoi_es[Form:C1466.posQuoiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.role_es:=Form:C1466.quoi_e.roles.query("ID_Qui > 0")
	Form:C1466.roleGroupe_es:=Form:C1466.quoi_e.roles.query("ID_Groupe > 0")
	Form:C1466.message:="Info sur '"+Form:C1466.quoi_e.Nom+"'"
	
	//photo
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"o"+String:C10(Form:C1466.quoi_e.ID; "0000000")+".png"
	READ PICTURE FILE:C678($x; $img_i)
	If (OK=1)
		Form:C1466.photoQuoi_i:=$img_i
	Else 
		Form:C1466.photoQuoi_i:=Null:C1517
	End if 
	
End if 

