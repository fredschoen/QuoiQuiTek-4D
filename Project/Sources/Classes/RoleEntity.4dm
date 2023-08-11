Class extends Entity

local Function getAge : Integer
	
	
	var $age : Integer
	var $anneeQuoi : Integer
	
	$anneeQuoi:=_anneeDeDateText(This:C1470.quoi.Annee)
	
	If ((This:C1470.qui.AnneeNaiss=0) | ($anneeQuoi=0))
		$age:=0
	Else 
		$age:=$anneeQuoi-This:C1470.qui.AnneeNaiss
	End if 
	
	return $age
	
	