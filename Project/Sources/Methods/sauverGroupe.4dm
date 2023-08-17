//%attributes = {}
// sauverGroupe
// Entrée: Form.groupe_e et .action
var $status_o : Object

$status_o:=Form:C1466.groupe_e.save()

If ($status_o.success)
	If (Form:C1466.action="AJOUTER")
		
		ALERT:C41("Enreg Groupe ajouté")
		Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
		visibleBtNavig
		
	Else 
		ALERT:C41("Enreg Groupe modifié")
	End if 
	
Else 
	ALERT:C41("erreur de sauegarde de l'enreg")
	TRACE:C157  // pour étude erreur
	
End if 
