Class extends Entity

local Function getAge->$age : Integer
	
	var $age; $anneeNaiss; $anneeDeces : Integer
	$anneeNaiss:=_anneeDeDateText(This:C1470.DateNaiss)
	$anneeDeces:=_anneeDeDateText(This:C1470.DateDeces)
	
	Case of 
		: (($anneeNaiss>0) & ($anneeDeces>0))
			$age:=$anneeDeces-$anneeNaiss
		: (($anneeNaiss>0) & ($anneeDeces=0))
			$age:=Year of:C25(Current date:C33)-$anneeNaiss
		Else 
			$age:=0
	End case 
	