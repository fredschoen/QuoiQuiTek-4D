// btSelectionnerQui
// correspond à "ajouter un role à ce quoi"
If (Form:C1466.quoiID_ajouterRole=Null:C1517)
	ALERT:C41("Form.quoiID_ajouterRole=null")
	TRACE:C157
End if 

Case of 
	: (Form:C1466.utilisationListe="AJOUTER_QUI")
		CONFIRM:C162("voulez-vous ajouter ce qui au groupe ?")
		If (OK=1)
			sauverQuiGroupe(Form:C1466.qui_e.ID; Form:C1466.groupeID_ajouterQui)
			ACCEPT:C269
		End if 
		
	: (Form:C1466.utilisationListe="AJOUTER_ROLE")
		CONFIRM:C162("voulez-vous ajouter ce qui aux roles du quoi ?")
		If (OK=1)
			sauverRoleNouveau(Form:C1466.qui_e.ID; Form:C1466.quoiID_ajouterRole)
			ACCEPT:C269
		End if 
	Else 
		TRACE:C157
		
End case 



