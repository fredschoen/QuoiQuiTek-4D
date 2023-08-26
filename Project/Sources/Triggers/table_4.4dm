//Trigger sur Groupe

Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Groupe:4]CreatTS:6:=Substring:C12(Timestamp:C1445; 1; 19)
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Groupe:4]ModifTS:7:=Substring:C12(Timestamp:C1445; 1; 19)
	Else 
		//autre événement: rien 
End case 