//Trigger sur quoi

Case of 
		////suppression
		//: (Trigger event=On Deleting Record Event)
		//QUERY([Role]; [Role]ID_Quoi=[Quoi]ID)
		
		//FIRST RECORD([Role])
		//For ($Position; 1; Records in selection([Role]))
		//DELETE RECORD([Role])
		//NEXT RECORD([Role])
		//End for 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Quoi:1]CreatDate:14:=Current date:C33
		[Quoi:1]CreatHeure:15:=Current time:C178
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Quoi:1]ModifDate:16:=Current date:C33
		[Quoi:1]ModifHeure:17:=Current time:C178
	Else 
		//autre événement: rien 
End case 