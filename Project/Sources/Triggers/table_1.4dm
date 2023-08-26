//Trigger sur Quoi

Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Quoi:1]CreatTS:14:=Substring:C12(Timestamp:C1445; 1; 19)
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Quoi:1]ModifTS:15:=Substring:C12(Timestamp:C1445; 1; 19)
	Else 
		//autre événement: rien 
End case 