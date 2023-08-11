//%attributes = {}
// charger_unQuoi

var $anneeQuoi : Integer

Form:C1466.message:=""

//visibilité des boutons de navigation
visibleBtNavig

// TODO: \
1. si revient en affichage sur un  quoi qu'on vient d'ajouter, alors \
corriger pour quer Form.quoiSel_ePos soit à zéro \
2. normalement, on aura (Form.quoiSel_ePos=0) \
  -> pas de bt de navigation \
  -> Form.quoi reste inchangé

// en plus: ne pas afficher les boutons si la liste = 0 ou 1 element ou si on vient d'ajouter ce quoi
If ((Form:C1466.quoi_es.length<2)\
 | (Form:C1466.posQuoiSel_i=0))
	OBJECT SET VISIBLE:C603(*; "btSuivant@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btPrecedent@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btPremier@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btDernier@"; False:C215)
	
End if 

//se déplacer dans la liste box de page  1
Case of 
		
	: (Form:C1466.action="PRECEDENT")
		If (Form:C1466.posQuoiSel_i>1)
			Form:C1466.posQuoiSel_i:=Form:C1466.posQuoiSel_i-1
		Else 
			Form:C1466.posQuoiSel_i:=Form:C1466.quoi_es.length
		End if 
		
	: (Form:C1466.action="SUIVANT")
		If (Form:C1466.posQuoiSel_i<Form:C1466.quoi_es.length)
			Form:C1466.posQuoiSel_i:=Form:C1466.posQuoiSel_i+1
		Else 
			Form:C1466.posQuoiSel_i:=1
		End if 
		
	: (Form:C1466.action="PREMIER")
		Form:C1466.posQuoiSel_i:=1
		
	: (Form:C1466.action="DERNIER")
		Form:C1466.posQuoiSel_i:=Form:C1466.quoi_es.length
		
	Else 
		
End case 

// après mise à jour du "Form.quoiSel_ePos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

//"Form.quoi_es" est vide: aucun quoi trouvé suivant les critères, \
du coup l'utilisateur en crée un mais la liste reste vide.... CQFD 
If ((Form:C1466.quoi_es.length=0)\
 | (Form:C1466.posQuoiSel_i=0))
	// pour test: CONFIRMER("charger_unQuoi: Form.quoi_es.length=0")
Else 
	//les info sur le quoi sélectionné: pour affichage détail
	C_LONGINT:C283($ind)
	$ind:=Form:C1466.posQuoiSel_i-1  //si position=1, alors indice=0
	Form:C1466.quoi:=Form:C1466.quoi_es[$ind]
	
End if 

//les info complémentaires de quoi (non lues par liste quois)
C_OBJECT:C1216($quoi)
$quoi:=ds:C1482.Quoi.query("ID=:1"; Form:C1466.quoi.ID)
Form:C1466.infoQuoi:=$quoi[0].Info

//les info pour chaque role dans le quoi
C_OBJECT:C1216($role_liste; $role_ele; $qui_ele; $obj)
C_LONGINT:C283($ageQui)
$role_liste:=ds:C1482.Role.query("ID_Quoi=:1"; Form:C1466.quoi.ID).orderBy("Descr")
Form:C1466..role_es:=New collection:C1472
For each ($role_ele; $role_liste)
	$qui_ele:=ds:C1482.Qui.query("ID=:1"; $role_ele.ID_Qui)
	If ($qui_ele.length=0)
		ALERT:C41("pb dans chargerQuoiDetail : $qui_ele.length=0")
	Else 
		$anneeQuoi:=_anneeDeDateText(Form:C1466.quoi.Annee)
		If (($qui_ele[0].AnneeNaiss=0) | ($anneeQuoi=0))
			$ageQui:=0
		Else 
			$ageQui:=$anneeQuoi-$qui_ele[0].AnneeNaiss
		End if 
		$obj:=New object:C1471("AgeQui"; $ageQui; \
			"role"; $role_ele.toObject("Descr,ID,ID_Qui,ID_Quoi,Photo"); \
			"qui"; $qui_ele[0].toObject("Nom,AnneeNaiss,AnneeDeces,Genre,Pays,ID,Photo"))
		Form:C1466..role_es.push($obj)
	End if 
End for each 

Form:C1466.TitrePage3:="Role dans '"+Form:C1466.quoi.Nom+"'"

//mémoriser le nouvel élément courant
Form:C1466.quoiSel_e:=Form:C1466.quoi
