//Accueil

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		//charger les listes de valeurs
		//DomaineQui
		QUERY:C277([Qui:2]; [Qui:2]Domaine:8>"A")
		DISTINCT VALUES:C339([Qui:2]Domaine:8; $tab)
		ARRAY TO LIST:C287($tab; "DomaineQui")
		
		//StyleQui
		QUERY:C277([Qui:2]; [Qui:2]Style:9>"A")
		DISTINCT VALUES:C339([Qui:2]Style:9; $tab)
		ARRAY TO LIST:C287($tab; "StyleQui")
		
		//PaysQui
		QUERY:C277([Qui:2]; [Qui:2]Pays:5>"A")
		DISTINCT VALUES:C339([Qui:2]Pays:5; $tabPaysQui)
		ARRAY TO LIST:C287($tabPaysQui; "PaysQui")
		
		//PaysQuoi
		QUERY:C277([Quoi:1]; [Quoi:1]Pays:4>"A")
		DISTINCT VALUES:C339([Quoi:1]Pays:4; $tabPaysQuoi)
		ARRAY TO LIST:C287($tabPaysQuoi; "PaysQuoi")
		
		//GenreQuoi
		QUERY:C277([Quoi:1]; [Quoi:1]Genre:3>"A")
		DISTINCT VALUES:C339([Quoi:1]Genre:3; $tabGenreQuoi)
		ARRAY TO LIST:C287($tabGenreQuoi; "GenreQuoi")
		
		//StockQuoi
		QUERY:C277([Quoi:1]; [Quoi:1]Stock:5>"A")
		DISTINCT VALUES:C339([Quoi:1]Stock:5; $tabStockQuoi)
		ARRAY TO LIST:C287($tabStockQuoi; "StockQuoi")
		
		//DomaineQuoi
		QUERY:C277([Quoi:1]; [Quoi:1]Domaine:8>"A")
		DISTINCT VALUES:C339([Quoi:1]Domaine:8; $tabDomaineQuoi)
		ARRAY TO LIST:C287($tabDomaineQuoi; "DomaineQuoi")
		
End case 