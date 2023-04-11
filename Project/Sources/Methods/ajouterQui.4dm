//%attributes = {}
//ajouterQui

Form:C1466.action:="AJOUTER"

C_OBJECT:C1216($form_obj)
$form_obj:=New object:C1471

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("quiDetail")
DIALOG:C40("quiDetail"; $form_obj)
CLOSE WINDOW:C154($win_l)

