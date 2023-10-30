select `Attack Type` as AttackType, count(*) as Number from otus.cybersecurity_attacks ca 
group by AttackType ORDER BY Number desc