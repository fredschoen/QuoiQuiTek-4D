//bParametre
afficherParametreListe()
initStorageValueLists()

//recharger la liste
OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQui")->values:=Storage:C1525.domaineQui

//replacer le pointeur dans la liste
$i:=Storage:C1525.domaineQui.indexOf(Form:C1466.qui_e.Domaine)
If ($i=-1)
	//valeur non trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQui")->index:=-1
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQui")->currentValue:=Form:C1466.qui_e.Domaine
Else 
	//valeur trouvée dans la liste déroulante
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_domaineQui")->index:=$i
End if 
