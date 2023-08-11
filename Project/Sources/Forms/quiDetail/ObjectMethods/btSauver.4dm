//btSauverQui
var $qui_o : Object

$qui_o:=sauverQui(Form:C1466.qui)

If (Not:C34($qui_o=Null:C1517))
	//actualiser Form
	Form:C1466.qui:=$qui_o
	Form:C1466.quiSel_e:=$qui_o
End if 
