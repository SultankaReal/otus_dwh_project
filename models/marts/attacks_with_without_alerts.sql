select `Alerts/Warnings` AlertWarn, count(*) as Number from cybersecurity_attacks ca  
group by AlertWarn 
ORDER BY Number desc