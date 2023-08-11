//%attributes = {}
// charger_unQui
var $anneeQuoi : Integer

//visibilité des boutons de navigation
visibleBtNavig

// en plus: ne pas afficher les boutons si la liste = 0 ou 1 element, ou si on a ajouté cet qui
If ((Form:C1466.qui_es.length<2)\
 | (Form:C1466.posQuiSel_i=0))
	OBJECT SET VISIBLE:C603(*; "btSuivant@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btPrecedent@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btPremier@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btDernier@"; False:C215)
	
End if 



//se déplacer dans la liste box de page  1

//par défaut, on ne bouge pas
Form:C1466.posQuiSel_i:=Form:C1466.posQuiSel_i

Case of 
	: (Form:C1466.action="PREMIER")
		Form:C1466.posQuiSel_i:=1
		
	: (Form:C1466.action="PRECEDENT")
		If (Form:C1466.posQuiSel_i>1)
			Form:C1466.posQuiSel_i:=Form:C1466.posQuiSel_i-1
		Else 
			Form:C1466.posQuiSel_i:=Form:C1466.qui_es.length
		End if 
		
	: (Form:C1466.action="SUIVANT")
		If (Form:C1466.posQuiSel_i<Form:C1466.qui_es.length)
			Form:C1466.posQuiSel_i:=Form:C1466.posQuiSel_i+1
		Else 
			Form:C1466.posQuiSel_i:=1
		End if 
		
	: (Form:C1466.action="DERNIER")
		Form:C1466.posQuiSel_i:=Form:C1466.qui_es.length
		
End case 

// après mise à jour du "Form.eleCou...Pos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

//"Form.qui_es" est vide: aucun qui trouvé suivant les critères, \
du coup l'utilisateur en crée un mais la liste reste vide.... CQFD 
If ((Form:C1466.qui_es.length=0)\
 | (Form:C1466.posQuiSel_i=0))
	// pour test: CONFIRMER("charger_unQuoi: Form.qui_es.length=0")
	// pour test: Form.qui:=Form.quiSel_e
Else 
	//les info sur le qui sélectionné: pour affichage détail
	C_LONGINT:C283($ind)
	$ind:=Form:C1466.posQuiSel_i-1  //si position=1, alors indice=0
	//Form.qui:=Form.qui_es[$ind] //fred
	$qui_es:=ds:C1482.Qui.query("ID=:1"; Form:C1466.qui_es[$ind].ID)
	$qui_e:=$qui_es.first()
	Form:C1466.qui:=$qui_e
	
End if 
If (Form:C1466.qui=Null:C1517)
	//KO dans l'exécution!!!
	CONFIRM:C162("charger_unQuoi KO : (Form.qui=null) !!!")
Else 
	
	//liste des roles du qui (Form.quoi_es.*)
	C_OBJECT:C1216($role_liste; $role_ele; $quoi_liste; $obj)
	C_LONGINT:C283($ageQui)
	$role_liste:=ds:C1482.Role.query("ID_Qui=:1"; Form:C1466.qui.ID)
	//les info quoi de chaque role du qui
	Form:C1466.role_es:=New collection:C1472
	For each ($role_ele; $role_liste)
		$quoi_liste:=ds:C1482.Quoi.query("ID=:1"; $role_ele.ID_Quoi)
		If ($quoi_liste.length=0)  // si aucun quoi trouvé, créer un objet "bidon" pour avoir le n° quoi KO
			$obj:=New object:C1471("AgeQui"; 0)
		Else 
			$anneeQuoi:=_anneeDeDateText($quoi_liste[0].Annee)
			If ((Form:C1466.qui.AnneeNaiss=0) | ($anneeQuoi=0))
				$ageQui:=0
			Else 
				$ageQui:=$anneeQuoi-Form:C1466.qui.AnneeNaiss
			End if 
			
			$obj:=New object:C1471("AgeQui"; $ageQui; \
				"role"; $role_ele.toObject("Descr,ID,ID_Qui,ID_Quoi,Photo"); \
				"quoi"; $quoi_liste[0].toObject("Nom,Annee,Genre,Pays,Prod,Real,Stock,Domaine,ID,DateDernVisu"))
		End if 
		
		Form:C1466.role_es.push($obj)
	End for each 
	
	Form:C1466.role_es:=Form:C1466.role_es.orderBy("AgeQui asc")
	
	Case of 
		: (Form:C1466.qui.AnneeNaiss>0) & (Form:C1466.qui.AnneeDeces>0)
			Form:C1466.ageQui:="("+String:C10(Form:C1466.qui.AnneeDeces-Form:C1466.qui.AnneeNaiss)+")"
			
		: (Form:C1466.qui.AnneeNaiss>0) & (Form:C1466.qui.AnneeDeces=0)
			Form:C1466.ageQui:="("+String:C10(Year of:C25(Current date:C33)-Form:C1466.qui.AnneeNaiss)+")"
			
		Else 
			Form:C1466.ageQui:=""
	End case 
	
	
	Form:C1466.TitrePage3:="Role de "+Form:C1466.qui.Nom
	
	//mémoriser le nouvel élément courant
	Form:C1466.quiSel_e:=Form:C1466.qui
	
End if 

