var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.theme_e)

If ($pourSelectionner_b)
	Case of 
		: (Form:C1466.action="POUR_SELECTION")
			//rien
		Else 
			$form_o:=New object:C1471
			$form_o.page:=1
			$form_o.qui_es:=ds:C1482.Qui.all()
			$form_o.action:="DEPUIS_LISTE_THEME"
			dialoguer("quiListe"; $form_o)
	End case 
End if 
