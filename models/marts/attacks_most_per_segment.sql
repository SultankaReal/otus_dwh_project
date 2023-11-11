select `Network Segment` as NetworkSegment, count(*) as Number from otus.cybersecurity_attacks 
group by NetworkSegment ORDER BY Number desc