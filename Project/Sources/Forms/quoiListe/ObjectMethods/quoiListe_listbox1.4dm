//listbox quoiListe
C_BOOLEAN:C305($pourSelectionner)

$pourSelectionner:=False:C215

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)  // pour ne pas obliger à utiliser la souris 
		//(todo: comment détecter la frappe de "enter" dans la listebox)
		C_LONGINT:C283($frappe)
		$frappe:=Character code:C91(Keystroke:C390)
		If ($frappe=Right arrow key:K12:17)
			If (Form:C1466.quoiSel_e#Null:C1517)  // si un quoi est sélectionné
				$pourSelectionner:=True:C214
			End if 
		End if 
	: (Form event code:C388=On Clicked:K2:4)  // "ON Double Clicked" inutile : "On Clicked" détecté avant )
		If (Form:C1466.quoiSel_e#Null:C1517)  // si un quoi est sélectionné
			$pourSelectionner:=True:C214
		End if 
End case 

If ($pourSelectionner=True:C214)
	Form:C1466.action:="MODIFIER"
	Form:C1466.posQuoiSel_i:=Form:C1466.posQuoiSel_iInit
	chargerQuoiDetail
	Form:C1466.page:=2
	FORM GOTO PAGE:C247(Form:C1466.page)
End if 