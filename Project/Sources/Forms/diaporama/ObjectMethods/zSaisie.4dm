If (FORM Event:C1606.code=On Before Keystroke:K2:6)
	$touchCode_i:=Character code:C91(Keystroke:C390)  // -63235
	Case of 
		: ($touchCode_i=43) | ($touchCode_i=29) | ($touchCode_i=32)
			Form:C1466.compteur+=1
			Form_AfficherImg()
		: ($touchCode_i=45) | ($touchCode_i=28)
			Form:C1466.compteur-=1
			Form_AfficherImg()
			
			//: ($touchCode_i=41)
			//TRANSFORM PICTURE(Form.img; Scale; 2; 2)
			
	End case 
	Form:C1466.zSaisie:=""
End if 


