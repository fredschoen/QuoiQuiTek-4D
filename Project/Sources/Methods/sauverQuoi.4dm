//%attributes = {}
// sauverQuoi
var $status_o : Object
var $1; $qui_e : cs:C1710.QuiEntity
var $2; $photoQui_i : Picture
$quoi_e:=$1
$photoQuoi_i:=$2

$status_o:=$quoi_e.save()

If (Not:C34($status_o.success))
	ALERT:C41($status_o.statusText)
	TRACE:C157
	return 
End if 

If (Form:C1466.action="AJOUTER")
	//btSelectionner
	//passer en mode modif
	ALERT:C41("Enreg Quoi ajouté")
	Form:C1466.quoi_es.add(Form:C1466.quoi_e)  // pour navigation OK dans formulaire Détail
	Form:C1466.posQuoiSel_i+=1  //éviter posQuoiSel_i=0
	Form:C1466.addedQuoi_e:=Form:C1466.quoi_e  //pour ajout dans le formulaire liste
	Form:C1466.action:="MODIFIER"  // on passe de "ajouter" à "modifier"
	visibleBtNavig(Num:C11(Form:C1466.quoi_es.length))
	
Else 
	
	//ajouter, modifier ou supprimer le fichier photo
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"o"+String:C10($quoi_e.ID; "0000000")+".png"
	If (Picture size:C356($photoQuoi_i)>0)
		WRITE PICTURE FILE:C680($x; $photoQuoi_i)
		If (OK=0)
			ALERT:C41("échec WRITE PICTURE FILE")
			TRACE:C157
		End if 
		
	Else 
		//abandon de la photo
		If (Test path name:C476($x)=Is a document:K24:1)
			DELETE DOCUMENT:C159($x)
		End if 
	End if 
End if 

ALERT:C41("Enreg Quoi modifié")
