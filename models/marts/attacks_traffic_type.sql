select `Traffic Type` as TrafficType, count(*) as Number from otus.cybersecurity_attacks ca 
group by TrafficType ORDER BY Number desc