//formulaire groupeListe
Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du groupe ?")
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
		If (Undefined:C82(Form:C1466.critereListe))
			//criteres d'affichage :
			Form:C1466.critereListe:=New object:C1471
			Form:C1466.critereListe.FullName:=""
			Form:C1466.critereListe.Genre:=""
			Form:C1466.critereListe.Pays:=""
			Form:C1466.critereListe.DateNaiss:=""
			Form:C1466.critereListe.DateDeces:=""
			Form:C1466.critereListe.Domaine:=""
			Form:C1466.critereListe.Style:=""
		End if 
		
		
		If (Form:C1466.action="INIT")
			charger_LesGroupes
		End if 
		
End case 
