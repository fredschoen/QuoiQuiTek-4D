//%attributes = {}
//charger_LesRoles
var $es : 4D:C1709.EntitySelection
var $e : 4D:C1709.Entity
var $age : Integer
var $anneeQuoi : Integer
var $liste : Collection
var $toto : Object
Form:C1466.roleListe:=New collection:C1472
var $quiAjout : Object
var $quoiAjout : Object
var $go : Boolean
var $selection : Boolean

$go:=True:C214

$es:=ds:C1482.Role.all()

For each ($e; $es)
	If ($e.leQuiDuRole.length=0)
		//pour rattraper le KO!!
		$quiAjout:=ds:C1482.Quoi.new()
		$quiAjout.ID:=$e.ID_Qui
		$quiAjout.Nom:="coincoin Qui"
		$status:=$quiAjout.save()
		$go:=False:C215
	End if 
	
	If ($e.leQuoiDuRole.length=0)
		//pour rattraper le KO!!
		$quoiAjout:=ds:C1482.Quoi.new()
		$quoiAjout.ID:=$e.ID_Quoi
		$quoiAjout.Nom:="coincoin Quoi"
		$status:=$quoiAjout.save()
		
		$go:=False:C215
	End if 
	
	If ($go)
		$anneeQuoi:=_anneeDeDateText($e.leQuoiDuRole.Annee[0])
		
		If (($e.leQuiDuRole.AnneeNaiss[0]=0) | ($anneeQuoi=0))
			$age:=0
		Else 
			$age:=$anneeQuoi-$e.leQuiDuRole.AnneeNaiss[0]
		End if 
		
		$toto:=New object:C1471("ID"; $e.ID; "Age"; $age; "Descr"; $e.Descr; \
			"leQuiDuRole"; $e.leQuiDuRole[0].toObject(""); \
			"leQuoiDuRole"; $e.leQuoiDuRole[0].toObject(""))
		
		$selection:=True:C214
		$selection:=verifierSelectionRole(Form:C1466.critereRoleListe.Nom; $toto.leQuiDuRole.Nom; $selection)
		$selection:=verifierSelectionRole(Form:C1466.critereRoleListe.Genre; $toto.leQuiDuRole.Genre; $selection)
		$selection:=verifierSelectionRole(Form:C1466.critereRoleListe.Age; String:C10($toto.Age; "00"); $selection)
		If ($selection)
			Form:C1466.roleListe.push($toto)
		End if 
		
	End if 
End for each 
