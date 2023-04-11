// btSauverQuiEtRole

//qui
var $qui_o : Object
$qui_o:=sauverQui(Form:C1466.qui)
If (Not:C34($qui_o=Null:C1517))
	//actualiser Form, si pas d'erreur de sauvegarde
	Form:C1466.eleCouQui:=Form:C1466.qui
	
	//role
	sauverRole
	
End if 

