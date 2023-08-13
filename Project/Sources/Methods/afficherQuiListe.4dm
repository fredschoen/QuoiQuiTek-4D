//%attributes = {}
// afficherQuiListe
// $1: type d'utilisation de la liste
C_OBJECT:C1216($form_obj)
$form_obj:=New object:C1471
$form_obj.action:="INIT"  // chargement initial
$form_obj.page:=1

If (Count parameters:C259>0)
	$form_obj.utilisationListe:=$1
Else 
	$form_obj.utilisationListe:=""
End if 

//cas où on utilise la liste quis pour ajouter un role à un quoi
If ($form_obj.utilisationListe="AJOUTER_ROLE")
	If (Form:C1466.quoiSel_e=Null:C1517)
		CONFIRM:C162("afficherquiliste: (Form.quoiSel_e=null)")
	Else 
		$form_obj.quoiSel_e:=New object:C1471
		$form_obj.quoiSel_e:=Form:C1466.quoiSel_e
	End if 
End if 

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("quiListe")

While ($form_obj.page>0)  // 0 :quitter
	DIALOG:C40("quiListe"; $form_obj)
End while 

CLOSE WINDOW:C154($win_l)
