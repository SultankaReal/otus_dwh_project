select `Alerts/Warnings` AlertWarn, count(*) as Number from otus.cybersecurity_attacks  
group by AlertWarn 
ORDER BY Number desc