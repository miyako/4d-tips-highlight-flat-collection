//%attributes = {"invisible":true,"preemptive":"incapable"}
C_LONGINT:C283($1;$pos)
C_COLLECTION:C1488($2;$sel)
C_OBJECT:C1216($3;$4;$0)

$pos:=$1
$sel:=$2

$isSelected:=($sel.indexOf($pos)#-1)

If ($isSelected)
	$0:=$3
Else 
	$0:=$4
End if 