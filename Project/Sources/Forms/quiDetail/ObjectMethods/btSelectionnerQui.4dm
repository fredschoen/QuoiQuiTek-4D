// btSelectionnerQui
// correspond à "ajouter un role à ce quoi"

Case of 
	: (Form:C1466.utilisationListe="AJOUTER_POSTE")
		If (Form:C1466.quiGroupeID_ajouterPoste=Null:C1517)
			ALERT:C41("Form.quiGroupeID_ajouterPoste=null")
			TRACE:C157
		Else 
			CONFIRM:C162("voulez-vous ajouter ce qui au groupe ?")
			If (OK=1)
				ajouterPoste(Form:C1466.qui_e.ID; Form:C1466.quiGroupeID_ajouterPoste)
				ACCEPT:C269
			End if 
		End if 
		
	: (Form:C1466.utilisationListe="AJOUTER_ROLE")
		If (Form:C1466.quoiID_ajouterRole=Null:C1517)
			ALERT:C41("Form.quoiID_ajouterRole=null")
			TRACE:C157
		Else 
			CONFIRM:C162("voulez-vous ajouter ce qui aux roles du quoi ?")
			If (OK=1)
				ajouterRole(Form:C1466.qui_e.ID; Form:C1466.quoiID_ajouterRole; Form:C1466.utilisationListe)
				ACCEPT:C269
			End if 
		End if 
	Else 
		TRACE:C157
		
End case 



