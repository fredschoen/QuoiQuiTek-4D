//formulaire quoiDetailDiapo
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.utilisationListe:="DIAPO"
		Form:C1466.filtrePhoto_b:=False:C215
		charger_unQuoi(Current form name:C1298)
		//visibilité des boutons de navigation
		visibleBtNavig(Num:C11(Form:C1466.quoi_es.length))
		
	: (Form event code:C388=On Unload:K2:2)
		confirmerSortieForm("sortir du détail du quoi ?")
End case 