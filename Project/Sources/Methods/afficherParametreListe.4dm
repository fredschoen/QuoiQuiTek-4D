//%attributes = {}
$win_l:=Open form window:C675("accueil")
ALL RECORDS:C47([Parametre:7])
ORDER BY:C49([Parametre:7]Nom:2)
MODIFY SELECTION:C204([Parametre:7]; Single selection:K50:2; True:C214)
CLOSE WINDOW:C154($win_l)
initStorageValueLists()