//%attributes = {}
// charger_unQui
var $img_i : Picture
If (Form:C1466.action="AJOUTER")
	Form:C1466.qui_e:=ds:C1482.Qui.new()
	Form:C1466.qui_es:=ds:C1482.Qui.newSelection()  // l'entitySelection sera altérable (.add)
Else 
	//les info sur le qui sélectionné: pour affichage détail
	//KO SI ON VIENT DE role_Detail/lb_lesQuisDuQuoi
	Form:C1466.qui_e:=Form:C1466.qui_es[Form:C1466.posQuiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.relTheme_es:=Form:C1466.qui_e.relThemes.orderBy("theme.Nom")
	Form:C1466.DateNaiss:=_f_transfoDateQui_Edit(Form:C1466.qui_e.DateNaiss)
	Form:C1466.DateDeces:=_f_transfoDateQui_Edit(Form:C1466.qui_e.DateDeces)
	Form:C1466.role_es:=Form:C1466.qui_e.roles
	Form:C1466.role_es:=Form:C1466.role_es.orderBy("quoi.Date desc")
	Form:C1466.message:="Info sur '"+Form:C1466.qui_e.FullName+"'"
	SET TEXT TO PASTEBOARD:C523(Form:C1466.qui_e.FullName)
	//photo
	$y:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"i"+String:C10(Form:C1466.qui_e.ID; "0000000")+".png"
	$x:=Storage:C1525.param.dossierPhotos_t+"i"+String:C10(Form:C1466.qui_e.ID; "0000000")+".png"
	READ PICTURE FILE:C678($x; $img_i)
	If (OK=1)
		Form:C1466.photoQui_i:=$img_i
	Else 
		Form:C1466.photoQui_i:=Null:C1517
	End if 
	
End if 

// pour "ld_domaineQui"
$i:=Storage:C1525.domaineQui.indexOf(Form:C1466.qui_e.Domaine)
If ($i=-1)
	//valeur non trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQui")->index:=-1
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQui")->currentValue:=Form:C1466.qui_e.Domaine
Else 
	//valeur trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQui")->index:=$i
End if 

