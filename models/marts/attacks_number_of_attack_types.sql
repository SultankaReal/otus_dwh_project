select `Attack Type` as at, count(*) as Co from test.cybersecurity_attacks ca group by `Attack Type` ORDER BY count(*) desc