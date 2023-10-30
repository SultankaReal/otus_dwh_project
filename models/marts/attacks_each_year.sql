select DISTINCT toYear(`Timestamp`) as Year, count(*) as Number from otus.cybersecurity_attacks 
group by Year ORDER BY Number desc