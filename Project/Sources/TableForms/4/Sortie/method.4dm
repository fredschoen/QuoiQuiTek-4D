//sur chargement "zTODO, formuleire sortie)
Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		ORDER BY:C49([zTODO:4]; [zTODO:4]Priorité:2; >; *)
		ORDER BY:C49([zTODO:4]; [zTODO:4]Todo:3; >)
End case 
