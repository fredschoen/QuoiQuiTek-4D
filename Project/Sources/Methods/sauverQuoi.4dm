//%attributes = {}
// sauverQuoi
var $status_o : Object

$status_o:=Form:C1466.quoi.save()

If ($status_o.success)
	
	If (Form:C1466.action="AJOUTER")
		//btSelectionnerQuoi
		OBJECT SET VISIBLE:C603(*; "btSelectionnerQuoi"; (Form:C1466.utilisationListe="AJOUTER_ROLE"))
		//passer en mode modif
		ALERT:C41("Enreg Quoi ajouté")
		Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
	Else 
		
		ALERT:C41("Enreg Quoi modifié")
	End if 
	
Else 
	ALERT:C41($status_o.statusText)
	TRACE:C157
End if 
