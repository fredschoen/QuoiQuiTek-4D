//%attributes = {}
// afficherQuoiListe
//$S:  utilisationListe
C_OBJECT:C1216($form_obj)
$form_obj:=New object:C1471
$form_obj.action:="INIT"  // chargement initial
$form_obj.page:=1  // afficher page 1 pour commencer
If ($1>"")
	Form:C1466.utilisationListe:=$1
Else 
	Form:C1466.utilisationListe:=""
End if 
//cas où on utilise la liste quis pour ajouter un role à un quoi

If (Form:C1466.utilisationListe="AJOUTER_ROLE")
	$form_obj.eleCouQui:=New object:C1471
	$form_obj.eleCouQui:=Form:C1466.eleCouQui
End if 

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("quoiListe")
MAXIMIZE WINDOW:C453($win_l)
While ($form_obj.page>0)  // 0 :quitter
	DIALOG:C40("quoiListe"; $form_obj)
End while 
CLOSE WINDOW:C154($win_l)
