//%attributes = {"invisible":true,"preemptive":"incapable"}
C_COLLECTION:C1488($1;$col)
C_LONGINT:C283($2;$pos)
C_VARIANT:C1683($0)

$col:=$1
$pos:=$2

Case of 
	: ($pos=0)
		$0:=Null:C1517
	: ($pos>=$col.length)
		$0:=Null:C1517
	Else 
		$0:=$col[$pos-1]
End case 