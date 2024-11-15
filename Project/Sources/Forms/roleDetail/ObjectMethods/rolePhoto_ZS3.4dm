If (Form event code:C388=On Double Clicked:K2:5)
	$form_o:=New object:C1471()
	$form_o.image:=Form:C1466.photoRole_i
	$form_t:="photoZoom"
	$win_l:=Open form window:C675($form_t)
	DIALOG:C40($form_t; $form_o)
	CLOSE WINDOW:C154($win_l)
End if 
