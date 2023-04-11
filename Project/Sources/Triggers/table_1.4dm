//Trigger sur quoi

Case of 
		//suppression
	: (Trigger event:C369=On Deleting Record Event:K3:3)
		QUERY:C277([Role:3]; [Role:3]ID_Quoi:3=[Quoi:1]ID:1)
		
		FIRST RECORD:C50([Role:3])
		For ($Position; 1; Records in selection:C76([Role:3]))
			DELETE RECORD:C58([Role:3])
			NEXT RECORD:C51([Role:3])
		End for 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Quoi:1]CreatDate:14:=Current date:C33
		[Quoi:1]CreatHeure:15:=Current time:C178
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Quoi:1]ModifDate:16:=Current date:C33
		[Quoi:1]ModifHeure:17:=Current time:C178
	Else 
		//autre événement: rien 
End case 