//btAjouterQuoi

//page détail
C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("roleDetail")
MAXIMIZE WINDOW:C453($win_l)
$form_o:=New object:C1471()
$form_o.action:="AJOUTER"
$form_o.page:=1
$form_o.quoi:=ds:C1482.Quoi.new()
$form_o.quoi_es:=New collection:C1472  //fred (vider la collection chargée "plus tot dans l'exec")
$form_o.posQuoiSel_i:=0  // pour signifier que dans detailQuoi on est en AJPOUTER
While ($form_o.page>0)  // 0 :quitter
	DIALOG:C40("quoiDetail"; $form_o)
End while 
CLOSE WINDOW:C154($win_l)
