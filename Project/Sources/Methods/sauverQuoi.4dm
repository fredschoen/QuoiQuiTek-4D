//%attributes = {}
// sauverQuoi
var $status_o : Object
var $enregListe_es : 4D:C1709.EntitySelection
var $enreg_e : 4D:C1709.Entity

If (Form:C1466.action="AJOUTER")
	$enreg_e:=ds:C1482.Quoi.new()
	Form:C1466.quoi.ID:=$enreg_e.ID
Else 
	$enregListe_es:=ds:C1482.Quoi.query("ID=:1"; Form:C1466.quoi.ID)
	$enreg_e:=$enregListe_es.first()
	
End if 

$enreg_e.Nom:=Form:C1466.quoi.Nom
$enreg_e.Genre:=Form:C1466.quoi.Genre
$enreg_e.Pays:=Form:C1466.quoi.Pays
$enreg_e.Annee:=Form:C1466.quoi.Annee
$enreg_e.Real:=Form:C1466.quoi.Real
$enreg_e.Prod:=Form:C1466.quoi.Prod
$enreg_e.Stock:=Form:C1466.quoi.Stock
$enreg_e.Domaine:=Form:C1466.quoi.Domaine
$enreg_e.DateDernVisu:=Form:C1466.quoi.DateDernVisu
$enreg_e.Info:=Form:C1466.infoQuoi
$enreg_e.Qualif:=Form:C1466.quoi.Qualif
$enreg_e.Photo:=Form:C1466.quoi.Photo
$status_o:=$enreg_e.save()

//actualiser l'element courant
Form:C1466.eleCouQuoi:=Form:C1466.quoi

If ($status_o.success)
	
	If (Form:C1466.action="AJOUTER")
		//btSelectionnerQuoi
		OBJECT SET VISIBLE:C603(*; "btSelectionnerQuoi"; (_utilisationListe="AJOUTER_ROLE"))
		//passer en mode modif
		ALERT:C41("Enreg Quoi ajouté")
		Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
	Else 
		
		ALERT:C41("Enreg Quoi modifié")
	End if 
	
Else 
	ALERT:C41($status_o.statusText)
End if 
