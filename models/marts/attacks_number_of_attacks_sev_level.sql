select `Severity Level` as Severity, count(*) as Number from otus.cybersecurity_attacks 
group by Severity ORDER BY Number desc