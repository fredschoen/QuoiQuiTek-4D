// btSelectionnerQui
// correspond à "ajouter un role à ce quoi"
If (Form:C1466.quiID_ajouterRole=Null:C1517)
	ALERT:C41("Form.quiID_ajouterRole=null")
	TRACE:C157
End if 

CONFIRM:C162("voulez-vous ajouter ce qui aux roles du quoi ?")
If (OK=1)
	sauverRoleNouveau(Form:C1466.qui_e.ID; Form:C1466.quiID_ajouterRole)
	ACCEPT:C269
End if 
