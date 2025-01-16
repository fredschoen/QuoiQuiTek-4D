//formulaire quoiDetail
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		If (Undefined:C82(Form:C1466.utilisationListe))
			Form:C1466.utilisationListe:=""
		End if 
		//se déplacer dans la liste
		Form:C1466.posQuoiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.quoi_es.length; Form:C1466.posQuoiSel_i)
		//charger le quoi
		charger_unQuoi(Current form name:C1298)
		
		//visibilité des boutons de navigation
		visibleBtNavig(Num:C11(Form:C1466.quoi_es.length))
		
	: (Form event code:C388=On Unload:K2:2)
		confirmerSortieForm("sortir du détail du quoi ?")
End case 