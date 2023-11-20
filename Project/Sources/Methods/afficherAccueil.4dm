//%attributes = {}
// afficherAccueil
//ON ERR CALL("afficherErreur")

SET MENU BAR:C67(2)  // juste "quitter"
HIDE TOOL BAR:C434

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("accueil")
//MESSAGE("$win_l="+Chaîne($win_l))
//MAXIMIZE WINDOW($win_l)
DIALOG:C40("accueil")
CLOSE WINDOW:C154($win_l)
SET MENU BAR:C67(1)  // avec "Mode"
SHOW TOOL BAR:C433
