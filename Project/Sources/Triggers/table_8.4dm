Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Theme:8]CreatTS:3:=Substring:C12(Timestamp:C1445; 1; 19)
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Theme:8]ModifTS:4:=Substring:C12(Timestamp:C1445; 1; 19)
	Else 
		//autre événement: rien 
End case 