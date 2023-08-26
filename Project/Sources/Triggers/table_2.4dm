//Trigger sur Qui

If ([Qui:2]Prenom:16="")
	[Qui:2]FullName:2:=[Qui:2]Nom:15
Else 
	[Qui:2]FullName:2:=[Qui:2]Nom:15+" "+[Qui:2]Prenom:16
End if 

Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Qui:2]CreatTS:11:=Substring:C12(Timestamp:C1445; 1; 19)
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Qui:2]ModifTS:12:=Substring:C12(Timestamp:C1445; 1; 19)
	Else 
		//autre événement: rien 
End case 