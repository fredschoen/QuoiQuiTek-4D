//listbox quiListe

$pourSelectionner:=False:C215

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)  // pour ne pas obliger à utiliser la souris 
		//(todo: comment détecter la frappe de "enter" dans la listebox)
		C_LONGINT:C283($frappe)
		$frappe:=Character code:C91(Keystroke:C390)
		If ($frappe=Right arrow key:K12:17)
			If (Form:C1466.quiSel_e#Null:C1517)  // si un quoi est sélectionné
				$pourSelectionner:=True:C214
			End if 
		End if 
	: (Form event code:C388=On Clicked:K2:4)  // "ON Double Clicked" inutile : "On Clicked" détecté avant )
		If (Form:C1466.quiSel_e#Null:C1517)  // si un quoi est sélectionné
			$pourSelectionner:=True:C214
		End if 
End case 

If ($pourSelectionner=True:C214)
	Form:C1466.action:="MODIFIER"
	charger_unQui
	
	C_LONGINT:C283($win_l)
	$win_l:=Open form window:C675("quiDetail")
	MAXIMIZE WINDOW:C453($win_l)
	$form_o:=Form:C1466
	$form_o.page:=1
	While $form_o.page>0)  // 0 :quitter
		DIALOG:C40("quiDetail"; $form_o)
	End while 
	CLOSE WINDOW:C154($win_l)
	
	
	
End if 
