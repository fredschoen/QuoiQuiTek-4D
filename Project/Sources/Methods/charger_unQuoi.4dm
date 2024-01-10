//%attributes = {}
// charger_unQuoi
var $img_i : Picture

If (Form:C1466.action="AJOUTER")
	Form:C1466.quoi_e:=ds:C1482.Quoi.new()
	Form:C1466.quoi_es:=ds:C1482.Quoi.newSelection()  // l'entitySelection sera altérable (.add)
Else 
	//les info sur le quoi sélectionné: pour affichage détail
	Form:C1466.quoi_e:=Form:C1466.quoi_es[Form:C1466.posQuoiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.role_es:=Form:C1466.quoi_e.roles.query("ID_Qui > 0")
	Form:C1466.roleGroupe_es:=Form:C1466.quoi_e.roles.query("ID_Groupe > 0")
	Form:C1466.message:="Info sur '"+Form:C1466.quoi_e.Nom+"'"
	
	//photo
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"o"+String:C10(Form:C1466.quoi_e.ID; "0000000")+".png"
	READ PICTURE FILE:C678($x; $img_i)
	If (OK=1)
		Form:C1466.photoQuoi_i:=$img_i
	Else 
		Form:C1466.photoQuoi_i:=Null:C1517
	End if 
	
End if 

// pour "ld_domaineQuoi"
$i:=Storage:C1525.domaineQuoi.indexOf(Form:C1466.quoi_e.Domaine)
If ($i=-1)
	//valeur non trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->index:=-1
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->currentValue:=Form:C1466.quoi_e.Domaine
Else 
	//valeur trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->index:=$i
End if 

//mettre à jour les listes de valeurs dépendante du domaine
//1. stock
//1.1. liste complète 
$ListeStockQuoi_selStorage:=Storage:C1525.stockQuoi.query("type is :1"; Form:C1466.quoi_e.Domaine)
$ListeStockQuoi_tab:=$ListeStockQuoi_selStorage[0].values
OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->values:=$ListeStockQuoi_tab
//1.2. position dans la liste
$i:=Storage:C1525.stockQuoi.indexOf(Form:C1466.quoi_e.Domaine)
If ($i=-1)
	//valeur non trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->index:=-1
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->currentValue:=Form:C1466.quoi_e.Stock
Else 
	//valeur trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->index:=$i
End if 
