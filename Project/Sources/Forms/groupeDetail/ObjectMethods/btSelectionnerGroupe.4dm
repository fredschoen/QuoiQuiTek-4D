// btSelectionnerQuoi
// correspond à "ajouter un role à ce quoi"

If (Form:C1466.acteurID_ajouterRole=Null:C1517)
	ALERT:C41("Form.acteurID_ajouterRole=null")
	TRACE:C157
End if 

CONFIRM:C162("voulez-vous ajouter ce quoi à la carrière du qui ?")
If (OK=1)
	sauverRoleNouveau(Form:C1466.acteurID_ajouterRole; Form:C1466.quoi_e.ID; Form:C1466.utilisationListe)
	
	ACCEPT:C269
End if 
