//listbox .role_es

$pourSelectionner:=False:C215

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)  // pour ne pas obliger à utiliser la souris 
		//(todo: comment détecter la frappe de "enter" dans la listebox)
		C_LONGINT:C283($frappe)
		$frappe:=Character code:C91(Keystroke:C390)
		If ($frappe=Right arrow key:K12:17)
			If (Form:C1466.roleSel_e#Null:C1517)  // si un quoi est sélectionné
				$pourSelectionner:=True:C214
			End if 
		End if 
	: (Form event code:C388=On Clicked:K2:4)  // "ON Double Clicked" inutile : "On Clicked" détecté avant )
		If (Form:C1466.roleSel_e#Null:C1517)  // si un quoi est sélectionné
			$pourSelectionner:=True:C214
		End if 
End case 

If ($pourSelectionner=True:C214)
	$form_o:=New object:C1471
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.role_es:=Form:C1466.role_es
	$form_o.posRoleSel_i:=Form:C1466.posRoleSel_i
	C_LONGINT:C283($win_l)
	$win_l:=Open form window:C675("roleDetail")
	MAXIMIZE WINDOW:C453($win_l)
	While ($form_o.page>0)  // 0 :quitter
		DIALOG:C40("roleDetail"; $form_o)
	End while 
	CLOSE WINDOW:C154($win_l)
	
End if 
