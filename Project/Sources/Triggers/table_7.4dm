Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Parametre:7]CreatTS:5:=Substring:C12(Timestamp:C1445; 1; 19)
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Parametre:7]ModifTS:6:=Substring:C12(Timestamp:C1445; 1; 19)
	Else 
		//autre événement: rien 
End case 