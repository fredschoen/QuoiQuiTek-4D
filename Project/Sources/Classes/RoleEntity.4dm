Class extends Entity

Function get Age->$age : Integer
	
	
	var $anneeQuoi; $anneeQui : Integer
	
	$anneeQuoi:=_anneeDeDateText(This:C1470.quoi.Date)
	$anneeQui:=_anneeDeDateText(This:C1470.qui.DateNaiss)
	
	If (($anneeQui=0) | ($anneeQuoi=0))
		$age:=0
	Else 
		$age:=$anneeQuoi-$anneeQui
	End if 
	
Function getAge->$age : Integer
	
	
	var $anneeQuoi; $anneeQui : Integer
	
	$anneeQuoi:=_anneeDeDateText(This:C1470.quoi.Date)
	$anneeQui:=_anneeDeDateText(This:C1470.qui.DateNaiss)
	
	If (($anneeQui=0) | ($anneeQuoi=0))
		$age:=0
	Else 
		$age:=$anneeQuoi-$anneeQui
	End if 
	
	
Function getNom->$nom : Text
	
	Case of 
		: (This:C1470.ID_Qui>0)
			$nom:=This:C1470.qui.FullName
		Else 
			$nom:="<ko>"
	End case 
	
	
	