//%attributes = {}
// charger_unQuoi(Current form name)
#DECLARE($currentFormName : Text)
var $img_i : Picture

If (Form:C1466.action="AJOUTER")
	Form:C1466.quoi_e:=ds:C1482.Quoi.new()
	Form:C1466.quoi_es:=ds:C1482.Quoi.newSelection()  // l'entitySelection sera altérable (.add)
Else 
	//les info sur le quoi sélectionné: pour affichage détail
	Form:C1466.quoi_e:=Form:C1466.quoi_es[Form:C1466.posQuoiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.relTheme_es:=Form:C1466.quoi_e.relThemes.orderBy("theme.Nom")
	Form:C1466.role_es:=Form:C1466.quoi_e.roles.query("ID_Qui > 0")
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

If (OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")#Null:C1517)  //dans formulaire diapo, pas de ld_domaineQuoi
	// pour "ld_domaineQuoi"
	If (Form:C1466.action#"AJOUTER")
		$i:=Storage:C1525.domaineQuoi.indexOf(Form:C1466.quoi_e.Domaine)
		If ($i=-1)
			//valeur non trouvée dans la liste déroulante
			OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->index:=-1
			OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->currentValue:=Form:C1466.quoi_e.Domaine
		Else 
			//valeur trouvée dans la liste déroulante
			OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->index:=$i
		End if 
	End if 
	
	//mettre à jour les listes de valeurs dépendante du domaine
	//1. stock
	//1.1. liste complète 
	If ((Form:C1466.action#"AJOUTER") & (Form:C1466.quoi_e.Domaine>""))
		$storageStockQuoi_o:=Storage:C1525.stockQuoi.query("type is :1"; Form:C1466.quoi_e.Domaine)[0]
		$storageStockQuoiValues_c:=$storageStockQuoi_o.values
		OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->values:=$storageStockQuoiValues_c
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
	End if 
End if 

If ($currentFormName="quoiDetail")
	LISTBOX SELECT ROW:C912(*; "lb_lesQuisDuQuoi"; 1; lk replace selection:K53:1)
	OBJECT SET SCROLL POSITION:C906(*; "lb_lesQuisDuQuoi"; 1)
End if 