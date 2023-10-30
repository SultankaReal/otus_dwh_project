select `Source IP Address` as SourceIP, `Anomaly Scores` , `Device Information` from otus.cybersecurity_attacks ca 
where `Attack Type` = 'DDoS' 
and `Action Taken` not like '%Blocked%'
and `Severity Level` = 'High'
and `Firewall Logs` not like '%Log%'
and `Packet Length` > 1450
and `Alerts/Warnings` not like '%Triggered%'
and `Anomaly Scores` BETWEEN 80 and 100
order by 2 desc