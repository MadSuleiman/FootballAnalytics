SELECT'________________________________________________________________________';
SELECT'16. Find the best player of each position';
SELECT'________________________________________________________________________';
select position, p_name, max(tds) as tds from(
select position, p_name, sum(pass_td + rec_td + rush_td) as tds
    from players, players2positions, positions, stats
    where players.id = players2Positions.playerid
    and positionID = positions.id 
    and players.id = stats.playerID
    and year = 2021
    group by position, p_name
    order by tds desc
)
group by position
order by tds desc