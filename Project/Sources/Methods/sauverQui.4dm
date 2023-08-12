//%attributes = {}
// sauverQui
// Entrée: Form.qui et .action
var $status_o : Object

$status_o:=Form:C1466.qui.save()

If ($status_o.success)
	If (Form:C1466.action="AJOUTER")
		//btSelectionnerQui   
		OBJECT SET VISIBLE:C603(*; "btSelectionnerQui"; (Form:C1466.utilisationListe="AJOUTER_ROLE"))
		//passer en mode modif
		
		ALERT:C41("Enreg Qui ajouté")
		Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
	Else 
		ALERT:C41("Enreg Qui modifié")
	End if 
	
Else 
	ALERT:C41("erreur de sauegarde de l'enreg")
	TRACE:C157  // pour étude erreur
	
End if 
