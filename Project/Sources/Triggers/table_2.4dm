//Trigger sur Qui

Case of 
		//suppression
	: (Trigger event:C369=On Deleting Record Event:K3:3)
		QUERY:C277([Role:3]; [Role:3]ID_Qui:2=[Qui:2]ID:1)
		
		FIRST RECORD:C50([Role:3])
		For ($Position; 1; Records in selection:C76([Role:3]))
			DELETE RECORD:C58([Role:3])
			NEXT RECORD:C51([Role:3])
		End for 
		
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Qui:2]CreatDate:11:=Current date:C33
		[Qui:2]CreatHeure:12:=Current time:C178
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Qui:2]ModifDate:13:=Current date:C33
		[Qui:2]ModifHeure:14:=Current time:C178
	Else 
		//autre événement: rien 
End case 