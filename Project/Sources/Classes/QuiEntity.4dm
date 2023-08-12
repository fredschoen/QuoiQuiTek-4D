Class extends Entity

local Function getAge->$age : Integer
	
	var $age : Integer
	
	If ((This:C1470.qui.AnneeNaiss=0) | ($anneeQuoi=0))
		$age:=0
	Else 
		$age:=Year of:C25(Current date:C33)-Form:C1466.qui.AnneeNaiss
		
	End if 
	
	