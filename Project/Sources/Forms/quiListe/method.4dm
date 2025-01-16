//formulaire quiListe
var $AfficherListeVide_b : Boolean
$AfficherListeVide_b:=False:C215

Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		confirmerSortieForm("sortir du détail du qui ?")
		
	: (Form event code:C388=On Load:K2:1)
		If (Undefined:C82(Form:C1466.action))
			Form:C1466.action:="INIT"
			Form:C1466.utilisationListe:=""
			Form:C1466.page:=1
			$AfficherListeVide_b:=True:C214
		End if 
		
		If (Undefined:C82(Form:C1466.critereQuiListe))
			//criteres d'affichage :
			Form:C1466.critereQuiListe:=New object:C1471
			Form:C1466.critereQuiListe.Nom:=""
			Form:C1466.critereQuiListe.Prenom:=""
			Form:C1466.critereQuiListe.Genre:=""
			Form:C1466.critereQuiListe.Pays:=""
			Form:C1466.critereQuiListe.DateNaiss:=""
			Form:C1466.critereQuiListe.DateDeces:=""
			Form:C1466.critereQuiListe.Domaine:=""
			Form:C1466.critereQuiListe.Style:=""
			$AfficherListeVide_b:=True:C214
		End if 
		
		Case of 
			: (Form:C1466.action="INIT")
				If ($AfficherListeVide_b)
					Form:C1466.qui_es:=Null:C1517
				Else 
					charger_LesQuis
				End if 
			: (Form:C1466.action="DEPUIS_LISTE_THEME")
				
		End case 
		
End case 
