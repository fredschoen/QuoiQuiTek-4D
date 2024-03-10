var $pourSelectionner_b : Boolean

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		Form:C1466.qui_es:=ds:C1482.Qui.query("relThemes.ID_Theme = :1"; Form:C1466.theme_e.ID).orderBy("FullName")
		Form:C1466.quoi_es:=ds:C1482.Qui.query("relThemes.ID_Theme = :1"; Form:C1466.theme_e.ID).orderBy("Nom")
	: (Form event code:C388=On Double Clicked:K2:5) & (Form:C1466.action="POUR_SELECTION") & (Form:C1466.theme_e#Null:C1517)
		Form:C1466.ID_Theme:=Form:C1466.theme_e.ID
		Form:C1466.page:=0  // 0 = quitter pour "dialoguer"
		ACCEPT:C269
	: (Form event code:C388=On Double Clicked:K2:5) & (Form:C1466.action#"POUR_SELECTION") & (Form:C1466.theme_e#Null:C1517)
		$form_o:=New object:C1471
		$form_o.page:=1
		$form_o.qui_es:=ds:C1482.Qui.all()
		$form_o.action:="DEPUIS_LISTE_THEME"
		dialoguer("quiListe"; $form_o)
		
End case 
