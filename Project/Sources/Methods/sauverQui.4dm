//%attributes = {}
// sauverQui
var $status_o : Object
var $1; $qui_e : cs:C1710.QuiEntity
var $2; $photoQui_i : Picture
$qui_e:=$1
$photoQui_i:=$2

$status_o:=$qui_e.save()

If ($status_o.success)
	If (Form:C1466.action="AJOUTER")
		
		ALERT:C41("Enreg Qui ajouté")
		Form:C1466.qui_es.add(Form:C1466.qui_e)  // pour navigation OK dans formulaire Détail (ici il y aura 1 seul entity dans la sélection)
		Form:C1466.posQuiSel_i+=1  //éviter posQuoiSel_i=0 (ici il y aura 1 seul entity dans la sélection)
		Form:C1466.addedQui_e:=Form:C1466.qui_e  //pour ajout dans le formulaire liste
		Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
		visibleBtNavig
		
	Else 
		ALERT:C41("Enreg Qui modifié")
	End if 
	
	//ajouter, modifier ou supprimer le fichier photo
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"i"+String:C10($qui_e.ID; "0000000")+".png"
	If (Picture size:C356($photoQui_i)>0)
		WRITE PICTURE FILE:C680($x; $photoQui_i)
	Else 
		//abandon de la photo
		If (Test path name:C476($x)=Is a document:K24:1)
			DELETE DOCUMENT:C159($x)
		End if 
	End if 
	
Else 
	ALERT:C41("erreur de sauegarde de l'enreg")
	TRACE:C157  // pour étude erreur
	
End if 
