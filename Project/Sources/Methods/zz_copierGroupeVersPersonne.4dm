//%attributes = {}
var $groupe_es : cs:C1710.GroupeSelection
var $groupe_e : cs:C1710.GroupeEntity
var $quiGroupe_e : cs:C1710.QuiEntity
var $poste_e : cs:C1710.PosteEntity
$groupe_es:=ds:C1482.Groupe.all()

For each ($groupe_e; $groupe_es)
	$quiGroupe_e:=ds:C1482.Qui.new()
	$quiGroupe_e.Domaine:="MUS"
	$quiGroupe_e.Nom:=$groupe_e.Nom
	$quiGroupe_e.Genre:="G"
	$o:=$quiGroupe_e.save()
	If (Not:C34($o.success))
		TRACE:C157
	End if 
	For each ($poste_e; $groupe_e.postes)
		$poste_e.ID_QuiGroupe:=$quiGroupe_e.ID
		$o:=$poste_e.save()
		If (Not:C34($o.success))
			TRACE:C157
		End if 
		
	End for each 
	
End for each 
