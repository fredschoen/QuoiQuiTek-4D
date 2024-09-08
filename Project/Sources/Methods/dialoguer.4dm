//%attributes = {}
//dialoguer
#DECLARE($form_t : Text; $form_o : Object)

If (Undefined:C82($form_o.page))
	$form_o.page:=1
End if 

C_LONGINT:C283($win_l)
$form_o.win_l:=Open form window:C675($form_t)
//MAXIMIZE WINDOW($win_l)
While ($form_o.page>0)  // 0 :quitter
	DIALOG:C40($form_t; $form_o)
End while 
CLOSE WINDOW:C154($form_o.win_l)
