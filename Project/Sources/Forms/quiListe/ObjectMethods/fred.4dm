$liste:=ds:C1482.Qui.query("AnneeDeces > 0 and DateDeces < :1"; "0").orderBy("Nom")
Form:C1466.qui_es:=$liste.orderBy("FullName")
