//bParametre
afficherParametreListe()
initStorageValueLists()

//recharger la liste
OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->values:=Storage:C1525.domaineQuoi

//replacer le pointeur dans la liste
$i:=Storage:C1525.domaineQuoi.indexOf(Form:C1466.quoi_e.Domaine)
If ($i=-1)
	//valeur non trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->index:=-1
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->currentValue:=Form:C1466.quoi_e.Domaine
Else 
	//valeur trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQuoi")->index:=$i
End if 
