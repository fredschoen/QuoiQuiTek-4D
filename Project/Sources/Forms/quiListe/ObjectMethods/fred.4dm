$liste:=ds:C1482.Qui.query("AnneeNaiss > 0 and DateNaiss < :1"; "0").orderBy("Nom")
Form:C1466.qui_es:=$liste.orderBy("FullName")
