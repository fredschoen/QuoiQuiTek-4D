//Trigger sur Qui

Case of 
		////suppression
		//: (Trigger event=On Deleting Record Event)
		//QUERY([Role]; [Role]ID_Qui=[Qui]ID)
		
		//FIRST RECORD([Role])
		//For ($Position; 1; Records in selection([Role]))
		//DELETE RECORD([Role])
		//NEXT RECORD([Role])
		//End for 
		
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Qui:2]CreatDate:11:=Current date:C33
		[Qui:2]CreatHeure:12:=Current time:C178
		[Qui:2]FullName:2:=[Qui:2]Nom:15+" "+[Qui:2]Prenom:16
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Qui:2]ModifDate:13:=Current date:C33
		[Qui:2]ModifHeure:14:=Current time:C178
		[Qui:2]FullName:2:=[Qui:2]Nom:15+" "+[Qui:2]Prenom:16
	Else 
		//autre événement: rien 
End case 