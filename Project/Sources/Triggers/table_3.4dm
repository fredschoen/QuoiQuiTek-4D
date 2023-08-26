//Trigger sur Role

Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Role:3]CreatTS:7:=Substring:C12(Timestamp:C1445; 1; 19)
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Role:3]ModifTS:8:=Substring:C12(Timestamp:C1445; 1; 19)
	Else 
		//autre événement: rien 
End case 