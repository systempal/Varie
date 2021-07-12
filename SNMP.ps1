#################################################################
# https://techexpert.tips/it/powershell-it/powershell-query-snmp/
#################################################################



#$SNMP = New-Object -ComObject olePrn.OleSNMP
#$SNMP.open('10.254.2.3','public',2,1000)
#$SNMPDATA=$SNMP.GetTree(".1.3.6.1.2.1.43")
#$RESULT=@()
#for($i=0;$i-lt $SNMPDATA.length/2;$i++){$RESULT+=[pscustomobject]@{"SNMP ID"=$SNMPDATA[0,$i];"SNMP Value"=$SNMPDATA[1,$i];OID=($snmp.OIDFromString(($SNMPDATA[0,$i])) -join ".")} }
#$RESULT | Format-Table -AutoSize | out-string -width 4096 

$SNMP = New-Object -ComObject olePrn.OleSNMP
$SNMP.open('10.254.2.3','public',2,1000)
$SNMPDATA=$SNMP.GetTree(".1.3.6.1.2.1.43")
$RESULT=@()
for($i=0;$i-lt $SNMPDATA.length/2;$i++){$RESULT+=[pscustomobject]@{"SNMP ID"=$SNMPDATA[0,$i];"SNMP Value"=$SNMPDATA[1,$i];OID=($snmp.OIDFromString(($SNMPDATA[0,$i])) -join ".")} }
$RESULT | Out-GridView

