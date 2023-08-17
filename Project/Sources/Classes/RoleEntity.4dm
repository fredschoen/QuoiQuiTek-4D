Class extends Entity

local Function getAge->$age : Integer
	
	
	var $age : Integer
	var $anneeQuoi; $anneeQui : Integer
	
	$anneeQuoi:=_anneeDeDateText(This:C1470.quoi.Date)
	$anneeQui:=_anneeDeDateText(This:C1470.qui.DateNaiss)
	
	If (($anneeQui=0) | ($anneeQuoi=0))
		$age:=0
	Else 
		$age:=$anneeQuoi-$anneeQui
	End if 
	
	