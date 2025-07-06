//%attributes = {}
//////////////////////////////////////////////////////////////////
// zExport
//////////////////////////////////////////////////////////////////
C_TEXT:C284($nomDefaut; $nomRepertoire; $nomDocument)
C_TEXT:C284($rc)
$rc:=Char:C90(Carriage return:K15:38)
$nomDefaut:=System folder:C487(Desktop:K41:16)+"_quoiquitek"+Folder separator:K24:12

$nomRepertoire:=Request:C163("Nom du répertoire d'export/import :"; $nomDefaut)

//vérifier le répertoire export/import choisi

If (OK=1)
	If (Test path name:C476($nomRepertoire)#Is a folder:K24:2)
		CREATE FOLDER:C475($nomRepertoire)
		CONFIRM:C162("Dossier "+$nomRepertoire+" inexistant."+$rc+"-> Ce répertoire vient d'être créé par la procédure")
	End if 
End if 

If (OK=1)
	ALERT:C41("ne pas quitter la base avant l'affichage de la fenêtre 'Export terminé'")
	yExport_QUOI($nomRepertoire)
	yExport_QUI($nomRepertoire)
	yExport_ROLE($nomRepertoire)
	
	ALERT:C41("Export terminé"+Char:C90(Carriage return:K15:38)+"cf. "+$nomRepertoire+"log.csv")
	
End if 

If (OK=1)
	SHOW ON DISK:C922($nomRepertoire)
End if 
