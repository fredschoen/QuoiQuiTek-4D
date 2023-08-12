//btAjouterQuoi

Form:C1466.quoi:=ds:C1482.Quoi.new()
Form:C1466.role_es:=New collection:C1472  //fred (vider la collection chargée "plus tot dans l'exec")

Form:C1466.posQuoiSel_i:=0  // pour signifier que dans detailQuoi on est en AJPOUTER

//visibilité des boutons de navigation
visibleBtNavig

//page détail
C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("roleDetail")
MAXIMIZE WINDOW:C453($win_l)
$form_o:=Form:C1466
$form_o.action:="AJOUTER"
$form_o.page:=1
While ($form_o.page>0)  // 0 :quitter
	DIALOG:C40("quoiDetail"; $form_o)
End while 
CLOSE WINDOW:C154($win_l)
