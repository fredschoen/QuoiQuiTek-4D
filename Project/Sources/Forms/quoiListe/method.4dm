//formulaire quoiListe
Form:C1466.message:=""

Case of 
	: (Form event code:C388=On Unload:K2:2)
		Case of 
			: (Form:C1466.page=1)  //"escape" sur page 1
				CONFIRM:C162("sortir de cette liste des quois  ?")
				If (OK=1)
					//"escape" sur page 1 =>sortir de l'écran
					//idem btQuitter
					Form:C1466.page:=0
					CANCEL:C270
				End if 
				
			: (Form:C1466.page=2)  //"escape" sur page 2
				// =>revenir à page 1
				Form:C1466.page:=1
				
			: (Form:C1466.page=3)  //"escape" sur page 3
				//"escape" sur page 3 =>revenir à page 2
				Form:C1466.page:=2
				//raffraichir le détail du quoi
				charger_unQuoi
		End case 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Undefined:C82(Form:C1466.action))  //ouvrir le formulaire sans passer par _afficherQuoiListe
			Form:C1466.action:="INIT"
			Form:C1466.page:=1  // afficher la page 1
			Form:C1466.utilisationListe:=""
			
		End if 
		If (Undefined:C82(Form:C1466.critereQuoiListe))  //ouvrir le formulaire sans passer par _afficherQuoiListe
			//criteres d'affichage :
			Form:C1466.critereQuoiListe:=New object:C1471
			Form:C1466.critereQuoiListe.Nom:=""
			Form:C1466.critereQuoiListe.Genre:=""
			Form:C1466.critereQuoiListe.Pays:=""
			Form:C1466.critereQuoiListe.Stock:=""
			Form:C1466.critereQuoiListe.Annee:=""
			Form:C1466.critereQuoiListe.Real:=""
			Form:C1466.critereQuoiListe.DateDernVisu:=""
			Form:C1466.critereQuoiListe.Domaine:=""
			Form:C1466.critereQuoiListe.Qualif:=""
		End if 
		
		If (Form:C1466.action="INIT")
			charger_lesQuois
		End if 
		// aller à la page précisée
		FORM GOTO PAGE:C247(Form:C1466.page)
		//si "escape de page 3: perte elecou -> actualiser élément courant
		Form:C1466.eleCouQuoi:=Form:C1466.quoi
		
End case 