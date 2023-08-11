// btSelectionQuoi
// correspond à "ajouter un role à ce quoi"
CONFIRM:C162("voulez-vous ajouter ce quoi à la carrière du qui ?")
If (OK=1)
	sauverRoleNouveau
	ACCEPT:C269
End if 
