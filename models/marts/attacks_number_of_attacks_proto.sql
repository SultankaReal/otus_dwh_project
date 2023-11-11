select `Protocol` as Protocol, count(*) as Number from otus.cybersecurity_attacks
group by Protocol ORDER BY Number desc