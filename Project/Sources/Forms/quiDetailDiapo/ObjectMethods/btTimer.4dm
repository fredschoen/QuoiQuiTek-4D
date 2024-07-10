// quiDetailDiapo.btTimer
//diapo automatique: activer/désactiver

If (Form event code:C388=On Load:K2:1)
	Form:C1466.timer_i:=0
End if 
If (Form event code:C388=On Clicked:K2:4)
	If (Form:C1466.timer_i=0)
		Form:C1466.timer_i:=Form:C1466.ticksDiapo_i
	Else 
		Form:C1466.timer_i:=0
	End if 
	
	SET TIMER:C645(Form:C1466.timer_i)
End if 

