//formulaire quiDetailDiapo
If (Form event code:C388=On Load:K2:1)
	
	Form:C1466.utilisationListe:="DIAPO"
	Form:C1466.filtrePhoto_b:=False:C215
	charger_unQui()
	//visibilité des boutons de navigation
	visibleBtNavig(Num:C11(Form:C1466.qui_es.length))
	
End if 

If (Form event code:C388=On Unload:K2:2)
	CONFIRM:C162("sortir du détail du qui ?")
	If (OK=1)
		//"escape" sur page 1 =>sortir de l'écran
		//idem btQuitter
		Form:C1466.page:=0
		CANCEL:C270
	End if 
	
End if 

If (Form event code:C388=On Timer:K2:25)
	Form:C1466.action:="SUIVANT"
	//se déplacer dans la liste
	Form:C1466.posQuiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.qui_es.length; Form:C1466.posQuiSel_i)
	//charger
	charger_unQui()
	
	If (Form:C1466.filtrePhoto_b)
		While (Form:C1466.photoQui_i=Null:C1517)
			Form:C1466.posQuiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.qui_es.length; Form:C1466.posQuiSel_i)
			//charger
			charger_unQui()
		End while 
	End if 
End if 