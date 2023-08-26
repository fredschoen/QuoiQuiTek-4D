//%attributes = {}
//////////////////////////////////////////////////////////////////
// zEXPORT_Qui
//////////////////////////////////////////////////////////////////

C_TEXT:C284($texte; $nom; $nomDefaut)
C_LONGINT:C283($nbrEnrExport)
C_TIME:C306($doc)
C_TEXT:C284($infoSuite)

var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity

$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
$nbrEnrExport:=0
If ($1=Null:C1517)
	$nomDefaut:=System folder:C487(Desktop:K41:16)+"_Quoiquitek"+Folder separator:K24:12+"Qui.csv"
Else 
	$nomDefaut:=$1+"Qui.txt"
End if 
//$nom:=Demander("Nom du fichier à créer :"; $nomDefaut)
$nom:=$nomDefaut
CONFIRM:C162("Début création de "+$nom)

If (OK=1)
	$doc:=Create document:C266($nom; "TEXT")
	//Ouvrir document($nom;"TEXT";mode ecriture)  ` Ouvrir le document Note 
End if 

If (OK=1)
	
	$vide:=""
	// entete colonne
	$texte:=""
	$texte:=$texte+"Prénom"+$tab
	$texte:=$texte+"Nom"+$tab
	$texte:=$texte+"Naiss"+$tab
	$texte:=$texte+"Deces"+$tab
	$texte:=$texte+"Dom"+$tab
	$texte:=$texte+"Gr"+$tab
	$texte:=$texte+"Pay"+$tab
	$texte:=$texte+"Info"+$tab
	$texte:=$texte+"Style"+$tab
	$texte:=$texte+"ID"+$tab
	$texte:=$texte+$rc
	//ecrire entete
	SEND PACKET:C103($doc; $texte)
	
	//$qui_es:=ds.Qui.all().orderBy("Nom, Prenom")
	$qui_es:=ds:C1482.Qui.query("Genre = :1 AND DateNaiss < :2 AND Domaine = :3"; "F"; "1"; "CINE").orderBy("Nom, Prenom")
	$texteTotal:=""
	For each ($qui_e; $qui_es)
		
		//-- assemblage de l'enreg à écrire------------------------------ 
		$texte:=""
		$texte:=$texte+String:C10($qui_e.Prenom)+$tab
		$texte:=$texte+String:C10($qui_e.Nom)+$tab
		$texte:=$texte+$qui_e.Domaine+$tab
		$texte:=$texte+$qui_e.Pays+$tab
		$texte:=$texte+$qui_e.Info+$tab
		$texte:=$texte+"x"+$tab
		
		//$texte:=$texte+$qui_e.Genre+$tab
		//$texte:=$texte+$qui_e.Domaine+$tab
		//$texte:=$texte+$qui_e.Genre+$tab
		//$texte:=$texte+$qui_e.Pays+$tab
		//$texte:=$texte+_f_chaineSansRc($qui_e.Info)+$infoSuite+$tab
		//$texte:=$texte+$qui_e.Style+$tab
		//$texte:=$texte+String($qui_e.ID)+$tab
		//$texte:=$texte+String($qui_e.CreatTS)+$tab
		//$texte:=$texte+String($qui_e.ModifTS)+$tab
		//$texte:=$texte+String($qui_e.DateNaiss)+$tab
		//$texte:=$texte+String($qui_e.DateDeces)+$tab
		//$pos:=Position(" "; $qui_e.FullName; 1)
		//$texte:=$texte+String($qui_e.Genre)+$tab
		//$texte:=$texte+String($qui_e.FullName)+$tab
		//$texte:=$texte+Substring($qui_e.DateNaiss; 1; 4)+$tab
		//$texte:=$texte+Substring($qui_e.DateDeces; 1; 4)+$tab
		$texte:=$texte+$rc
		$texteTotal:=$texteTotal+$texte
		SEND PACKET:C103($doc; $texte)
		$nbrEnrExport:=$nbrEnrExport+1
		////photo
		//If (Picture size($qui_e.Photo)>0)
		//$nomFicPhoto:=System folder(Desktop)+"_QuoiQuitek"+Folder separator+"PhotosQui"+Folder separator+$qui_e.FullName+"_"+"Qui_"+String($qui_e.ID)+".jpg"
		//WRITE PICTURE FILE($nomFicPhoto; $qui_e.Photo)
		//End if 
		
	End for each 
	
	SET TEXT TO PASTEBOARD:C523($texteTotal)
	CLOSE DOCUMENT:C267($doc)  // Fermer le document 
	$texteLog:="Fichier "+$nom+" créé"+$rc+String:C10($nbrEnrExport)+" enreg créés (+ 1 enreg entete)"
	ALERT:C41($texteLog)
End if 
