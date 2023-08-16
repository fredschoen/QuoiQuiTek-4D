//btAjouterQui

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("quiDetail")
MAXIMIZE WINDOW:C453($win_l)
$form_o:=New object:C1471()
$form_o.page:=1
$form_o.action:="AJOUTER"
$form_o.qui_e:=ds:C1482.Qui.new()
$form_o.qui_es:=New collection:C1472
$form_o.posQuiSel_i:=0
While ($form_o.page>0)  // 0 :quitter
	DIALOG:C40("quiDetail"; $form_o)
End while 
CLOSE WINDOW:C154($win_l)
