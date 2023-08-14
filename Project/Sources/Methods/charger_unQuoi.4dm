//%attributes = {}
// charger_unQuoi

var $anneeQuoi : Integer

Form:C1466.message:=""

//se déplacer dans la liste box de page  1
Case of 
		
	: (Form:C1466.action="PRECEDENT")
		If (Form:C1466.posQuoiSel_i>1)
			Form:C1466.posQuoiSel_i:=Form:C1466.posQuoiSel_i-1
		Else 
			Form:C1466.posQuoiSel_i:=Form:C1466.quoi_es.length
		End if 
		
	: (Form:C1466.action="SUIVANT")
		If (Form:C1466.posQuoiSel_i<Form:C1466.quoi_es.length)
			Form:C1466.posQuoiSel_i:=Form:C1466.posQuoiSel_i+1
		Else 
			Form:C1466.posQuoiSel_i:=1
		End if 
		
	: (Form:C1466.action="PREMIER")
		Form:C1466.posQuoiSel_i:=1
		
	: (Form:C1466.action="DERNIER")
		Form:C1466.posQuoiSel_i:=Form:C1466.quoi_es.length
		
	Else 
		
End case 

// après mise à jour du "Form.quoiSel_ePos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

//"Form.quoi_es" est vide: aucun quoi trouvé suivant les critères, \
du coup l'utilisateur en crée un mais la liste reste vide.... CQFD 
If ((Form:C1466.quoi_es.length=0)\
 | (Form:C1466.posQuoiSel_i=0))
	// pour test: CONFIRMER("charger_unQuoi: Form.quoi_es.length=0")
Else 
	//les info sur le quoi sélectionné: pour affichage détail
	C_LONGINT:C283($ind)
	$ind:=Form:C1466.posQuoiSel_i-1  //si position=1, alors indice=0
	Form:C1466.quoi:=Form:C1466.quoi_es[$ind]
	
End if 

Form:C1466.TitrePage3:="Role dans '"+Form:C1466.quoi.Nom+"'"

//mémoriser le nouvel élément courant
Form:C1466.quoiSel_e:=Form:C1466.quoi
