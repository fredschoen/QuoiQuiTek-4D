//%attributes = {}
//zzzViderPourPublier

// supprimer Quois sauf 1 (et donc role...)
ALL RECORDS:C47([Quoi:1])  // Sélection de tous les enregistrements
CONFIRM:C162(String:C10(Records in selection:C76([Quoi:1]))+" enreg quoi")

If (OK=1)
	
	QUERY:C277([Quoi:1]; [Quoi:1]ID:1#677)
	// Demander confirmation que l'utilisateur veut réellement supprimer les enregistrements
	$txt:=String:C10(Records in selection:C76([Quoi:1]))+" enregistrements à supprimer."
	$txt:=$txt+Char:C90(13)+"Cliquez sur OK pour confirmer l'opération."
	CONFIRM:C162($txt)
End if 

If (OK=1)
	DELETE SELECTION:C66([Quoi:1])  // Supprimer la sélection d'enregistrements
	CONFIRM:C162("suppression quois terminée")
End if 

ALL RECORDS:C47([Quoi:1])  // Sélection de tous les enregistrements

// quis sauf 2 (et donc role restant)
If (OK=1)
	
	ALL RECORDS:C47([Qui:2])  // Sélection de tous les enregistrements
	CONFIRM:C162(String:C10(Records in selection:C76([Qui:2]))+" enreg Qui")
End if 
If (OK=1)
	
	QUERY:C277([Qui:2]; [Qui:2]ID:1#153; *)
	QUERY:C277([Qui:2];  & ; [Qui:2]ID:1#445)
	
	// Demander confirmation que l'utilisateur veut réellement supprimer les enregistrements
	$txt:=String:C10(Records in selection:C76([Qui:2]))+" enregistrements à supprimer."
	$txt:=$txt+Char:C90(13)+"Cliquez sur OK pour confirmer l'opération."
	CONFIRM:C162($txt)
End if 

If (OK=1)
	DELETE SELECTION:C66([Qui:2])  // Supprimer la sélection d'enregistrements
	CONFIRM:C162("suppression quis terminée")
	
End if 

ALL RECORDS:C47([Qui:2])  // Sélection de tous les enregistrements

If (OK=1)
	CONFIRM:C162("fin procédure")
	
End if 
