//formulaire quiListe
Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du qui ?")
		If (OK=1)
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
	: (Form event code:C388=On Load:K2:1)
		If (Undefined:C82(Form:C1466.action))
			Form:C1466.action:="INIT"
			Form:C1466.utilisationListe:=""
			Form:C1466.page:=1
		End if 
		
		//criteres d'affichage :
		Form:C1466.critereQuiListe:=New object:C1471
		Form:C1466.critereQuiListe.FullName:=""
		Form:C1466.critereQuiListe.Genre:=""
		Form:C1466.critereQuiListe.Pays:=""
		Form:C1466.critereQuiListe.DateNaiss:=""
		Form:C1466.critereQuiListe.DateDeces:=""
		Form:C1466.critereQuiListe.Domaine:=""
		Form:C1466.critereQuiListe.Style:=""
		
		If (Form:C1466.action="INIT")
			charger_LesQuis
		End if 
		
End case 
