//%attributes = {}
//////////////////////////////////////////////////////////////////
// zEXPORT_Qui
//////////////////////////////////////////////////////////////////

C_TEXT:C284($texte; $nom; $nomDefaut)
C_LONGINT:C283($nbrEnrExport)
C_TIME:C306($doc; $log)
C_TEXT:C284($nomlog; $texteLog; $statutIntervention)
C_TEXT:C284($rc; $tab)

$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
If ($1=Null:C1517)
	$nomLog:=System folder:C487(Desktop:K41:16)+"_Quoiquitek"+Folder separator:K24:12+"log.txt"
Else 
	$nomLog:=$1+"log.txt"
End if 
$nbrEnrExport:=0
If ($1=Null:C1517)
	$nomDefaut:=System folder:C487(Desktop:K41:16)+"_Quoiquitek"+Folder separator:K24:12+"Qui.txt"
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
	$texte:=$texte+"ID"+$tab
	$texte:=$texte+"Prénom"+$tab
	$texte:=$texte+"Nom"+$tab
	$texte:=$texte+"AnneeNaiss"+$tab
	$texte:=$texte+"AnneeDeces"+$tab
	$texte:=$texte+"Domaine"+$tab
	$texte:=$texte+"Genre"+$tab
	$texte:=$texte+"Pays"+$tab
	$texte:=$texte+"Info"+$tab
	$texte:=$texte+"Style"+$tab
	$texte:=$texte+$rc
	//ecrire entete
	SEND PACKET:C103($doc; $texte)
	
	ALL RECORDS:C47([Qui:2])
	
	ORDER BY:C49([Qui:2]; [Qui:2]ID:1; >)
	
	C_TEXT:C284($vide; $str; $Info)
	C_LONGINT:C283($pos; $codeCar)
	
	While (Not:C34(End selection:C36([Qui:2])))
		
		
		//-- assemblage de l'enreg à écrire------------------------------ 
		$texte:=""
		$texte:=$texte+String:C10([Qui:2]ID:1)+$tab
		
		$prenom:=Substring:C12([Qui:2]FullName:2; 1; Position:C15(" "; [Qui:2]FullName:2)-1)
		$nom:=Substring:C12([Qui:2]FullName:2; Position:C15(" "; [Qui:2]FullName:2); Length:C16([Qui:2]FullName:2))
		
		$texte:=$texte+$prenom+$tab
		$texte:=$texte+$nom+$tab
		
		$texte:=$texte+String:C10([Qui:2]DateNaiss:17)+$tab
		$texte:=$texte+String:C10([Qui:2]DateDeces:18)+$tab
		$texte:=$texte+[Qui:2]Domaine:8+$tab
		$texte:=$texte+[Qui:2]Genre:3+$tab
		$texte:=$texte+[Qui:2]Pays:5+$tab
		
		$str:=[Qui:2]Info:10
		For ($pos; 1; Length:C16($str))
			$codeCar:=Character code:C91($str[[$pos]])
			Case of 
				: ($codeCar=Carriage return:K15:38)
					$str[[$pos]]:="|"
				: ($codeCar=Tab:K15:37)
					$str[[$pos]]:="^"
			End case 
		End for 
		
		$texte:=$texte+$str+$tab
		$texte:=$texte+[Qui:2]Style:9+$tab
		$texte:=$texte+String:C10([Qui:2]CreatDate:11)+$tab
		$texte:=$texte+String:C10([Qui:2]CreatHeure:12)+$tab
		$texte:=$texte+String:C10([Qui:2]ModifDate:13)+$tab
		$texte:=$texte+String:C10([Qui:2]ModifHeure:14)+$tab
		$texte:=$texte+$rc
		
		SEND PACKET:C103($doc; $texte)
		$nbrEnrExport:=$nbrEnrExport+1
		
		//photo
		If (Picture size:C356([Qui:2]Photo:7)>0)
			$nomFicPhoto:=System folder:C487(Desktop:K41:16)+"_QuoiQuitek"+Folder separator:K24:12+"PhotosQui"+Folder separator:K24:12+[Qui:2]FullName:2+"_"+"Qui_"+String:C10([Qui:2]ID:1)+".jpg"
			WRITE PICTURE FILE:C680($nomFicPhoto; [Qui:2]Photo:7)
		End if 
		
		
		NEXT RECORD:C51([Qui:2])
		
	End while 
	
	CLOSE DOCUMENT:C267($doc)  // Fermer le document 
	$texteLog:="Fichier "+$nom+" créé"+$rc+String:C10($nbrEnrExport)+" enreg créés (+ 1 enreg entete)"
	
	ALERT:C41($texteLog)
	
	If (Test path name:C476($nomlog)#Is a document:K24:1)
		$log:=Create document:C266($nomLog; "TEXT")
		SEND PACKET:C103($log; $rc)
		CLOSE DOCUMENT:C267($log)
	End if 
	
	$log:=Append document:C265($nomlog; "TEXT")
	
	//ecrire dans log
	SEND PACKET:C103($log; "----------------"+$rc+String:C10(Current date:C33)+" "+String:C10(Current time:C178)+":"+$rc)
	SEND PACKET:C103($log; $texteLog+$rc)
	CLOSE DOCUMENT:C267($log)  // Fermer le document 
	
End if 
