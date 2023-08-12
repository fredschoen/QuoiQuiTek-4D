//%attributes = {}
// sauverQui
// $1: qui: object
// $0: qui à jour si enreg OK : object (utile pour ID si "AJOUTER")
var $qui_o : Object
var $status_o : Object
var $enreg_o : Object
var $enregListe_o : Object
var $0 : Object
var $1 : Object
$qui_o:=$1

//If (Form.action="AJOUTER")
//$enreg_o:=ds.Qui.new()
//Else 
//$enregListe_o:=ds.Qui.query("ID=:1"; $qui_o.ID)
//$enreg_o:=$enregListe_o.first()
//End if 

//$enreg_o.AnneeDeces:=$qui_o.AnneeDeces
//$enreg_o.AnneeNaiss:=$qui_o.AnneeNaiss
//$enreg_o.Nom:=$qui_o.Nom
//$enreg_o.Pays:=$qui_o.Pays
//$enreg_o.Genre:=$qui_o.Genre
//$enreg_o.Photo:=$qui_o.Photo
//$enreg_o.Domaine:=$qui_o.Domaine
//$enreg_o.Info:=$qui_o.Info
//$enreg_o.Style:=$qui_o.Style
//$enreg_o.DateNaiss:=$qui_o.DateNaiss
//$enreg_o.Prenom:=$qui_o.Prenom

//$status_o:=$enreg_o.save()
$status_o:=$qui_o.save()

If ($status_o.success)
	If (Form:C1466.action="AJOUTER")
		//btSelectionnerQui   
		OBJECT SET VISIBLE:C603(*; "btSelectionnerQui"; (Form:C1466.utilisationListe="AJOUTER_ROLE"))
		//passer en mode modif
		
		ALERT:C41("Enreg Qui ajouté")
		Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
	Else 
		ALERT:C41("Enreg Qui modifié")
	End if 
	$0:=$enreg_o
Else 
	ALERT:C41("erreur se sauegarde de l'enreg")
	TRACE:C157  // pour étude erreur
	$0:=Null:C1517
End if 
