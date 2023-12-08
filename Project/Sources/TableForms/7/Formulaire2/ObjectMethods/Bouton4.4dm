CONFIRM:C162("supprimer ?"; "supprimer"; "abandonner suppression")
If (OK=1)
	
	DELETE RECORD:C58([Parametre:7])
	ALL RECORDS:C47([Parametre:7])
	ACCEPT:C269
	
End if 
