//%attributes = {}
// sauverQuoi
var $status_o : Object

$status_o:=Form:C1466.quoi_e.save()

If ($status_o.success)
	
	If (Form:C1466.action="AJOUTER")
		//btSelectionner
		//passer en mode modif
		ALERT:C41("Enreg Quoi ajouté")
		Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
		visibleBtNavig
	Else 
		
		ALERT:C41("Enreg Quoi modifié")
	End if 
	
Else 
	ALERT:C41($status_o.statusText)
	TRACE:C157
End if 
