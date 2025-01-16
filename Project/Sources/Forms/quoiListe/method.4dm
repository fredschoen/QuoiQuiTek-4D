//formulaire quoiListe
var $AfficherListeVide_b : Boolean
$AfficherListeVide_b:=False:C215
Case of 
	: (Form event code:C388=On Unload:K2:2)
		confirmerSortieForm("sortir de cette liste des quois  ?")
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Undefined:C82(Form:C1466.action))  //ouvrir le formulaire sans passer par _afficherQuoiListe
			Form:C1466.action:="INIT"
			Form:C1466.page:=1  // afficher la page 1
			Form:C1466.utilisationListe:=""
			$AfficherListeVide_b:=True:C214
		End if 
		
		If (Undefined:C82(Form:C1466.critereQuoiListe))  //ouvrir le formulaire sans passer par _afficherQuoiListe
			//criteres d'affichage :
			Form:C1466.critereQuoiListe:=New object:C1471
			Form:C1466.critereQuoiListe.Nom:=""
			Form:C1466.critereQuoiListe.Genre:=""
			Form:C1466.critereQuoiListe.Pays:=""
			Form:C1466.critereQuoiListe.Stock:=""
			Form:C1466.critereQuoiListe.Date:=""
			Form:C1466.critereQuoiListe.Real:=""
			Form:C1466.critereQuoiListe.DateDernVisu:=""
			Form:C1466.critereQuoiListe.Domaine:=""
			Form:C1466.critereQuoiListe.Qualif:=""
			$AfficherListeVide_b:=True:C214
		End if 
		
		If (Form:C1466.action="INIT")
			If ($AfficherListeVide_b)
				Form:C1466.quoi_es:=Null:C1517
			Else 
				charger_LesQuois
			End if 
			
		End if 
		// aller à la page précisée
		FORM GOTO PAGE:C247(Form:C1466.page)
		//si "escape de page 3: perte elecou -> actualiser élément courant
		Form:C1466.quoiSel_e:=Form:C1466.quoi_e
		
End case 