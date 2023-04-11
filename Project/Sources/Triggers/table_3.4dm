//Trigger de Role
Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		[Role:3]CreatDate:7:=Current date:C33
		[Role:3]CreatHeure:8:=Current time:C178
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		[Role:3]ModifDate:9:=Current date:C33
		[Role:3]ModifHeure:10:=Current time:C178
End case 