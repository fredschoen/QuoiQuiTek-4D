//btAjouterQui
Form:C1466.action:="AJOUTER"

//charger à vide
Form:C1466.qui:=ds:C1482.Qui.new()

Form:C1466.role_es:=New collection:C1472
//charger_unQui

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("quiDetail")
MAXIMIZE WINDOW:C453($win_l)
$form_o:=Form:C1466
$form_o.page:=1
While $form_o.page>0)  // 0 :quitter
	DIALOG:C40("quiDetail"; $form_o)
End while 
CLOSE WINDOW:C154($win_l)

//visibilité des boutons de navigation
visibleBtNavig
