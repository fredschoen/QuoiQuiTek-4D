//%attributes = {}
// charger_unQui
var $img_i : Picture
If (Form:C1466.posQuiSel_i>0)
	//les info sur le qui sélectionné: pour affichage détail
	Form:C1466.qui_e:=Form:C1466.qui_es[Form:C1466.posQuiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.role_es:=Form:C1466.qui_e.roles
	Form:C1466.role_es:=Form:C1466.role_es.orderBy("quoi.Date desc")
	Form:C1466.message:="Info sur '"+Form:C1466.qui_e.FullName+"'"
	
	//photo
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"i"+String:C10(Form:C1466.qui_e.ID; "0000000")+".png"
	READ PICTURE FILE:C678($x; $img_i)
	If (OK=1)
		Form:C1466.photoQui_i:=$img_i
	Else 
		Form:C1466.photoQui_i:=Null:C1517
	End if 
	
End if 


