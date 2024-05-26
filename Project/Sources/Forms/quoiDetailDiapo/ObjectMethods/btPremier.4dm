//btPremier
Form:C1466.action:="PREMIER"
//se déplacer dans la liste
Form:C1466.posQuoiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.quoi_es.length; Form:C1466.posQuoiSel_i)
//charger
charger_unQuoi()

