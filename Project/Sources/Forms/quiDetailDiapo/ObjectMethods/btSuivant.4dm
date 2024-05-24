//btSuivant

Form:C1466.action:="SUIVANT"
//se déplacer dans la liste
Form:C1466.posQuiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.qui_es.length; Form:C1466.posQuiSel_i)
//charger
charger_unQui()
