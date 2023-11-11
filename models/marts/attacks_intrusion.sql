select `Traffic Type` as TrafficType, `Malware Indicators` as MalInd, `Attack Type` as AttackType, `Anomaly Scores` as AnomSco, `User Information` from otus.cybersecurity_attacks 
where TrafficType = 'DNS' and MalInd LIKE '%IoC Detected%' 
and `Alerts/Warnings` not like '%Triggered%' 
and `Severity Level` = 'High' 
and AttackType like '%Intrusion%'
and AnomSco > 9
order by 4 desc
LIMIT 5