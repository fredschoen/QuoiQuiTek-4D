If (Form event code:C388=On Load:K2:1)
	WA OPEN URL:C1020(*; "WebZone"; "About:blank")
	OBJECT SET VISIBLE:C603(*; "WebZone"; False:C215)
	OBJECT SET VISIBLE:C603(*; "InputZone"; True:C214)
	OBJECT SET VISIBLE:C603(*; "btWebZone"; True:C214)
	OBJECT SET VISIBLE:C603(*; "btInputZone"; False:C215)
	
End if 

confirmerSortieForm()