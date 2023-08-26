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
	
	
local Function getNom->$nom : Text
	
	var $nom : Text
	If (This:C1470.ID_Qui>0)
		$nom:=This:C1470.qui.FullName
	Else 
		$nom:=This:C1470.groupe.Nom
	End if 
	
	