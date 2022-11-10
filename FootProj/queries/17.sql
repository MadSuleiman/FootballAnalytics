SELECT'________________________________________________________________________';
SELECT'17. Find the best passer, rusher, reciever combo';
SELECT'________________________________________________________________________';
select * from
(select p_name, sum(pass_td) as tds
    from players, stats, positions, players2positions
    where  players.id = stats.playerID
    and players.id = players2positions.playerid
    and players2positions.positionID = positions.id
    and position = "QB"
    and year = 2021
    group by p_name
    order by tds desc
    limit 1) as qb,

(select p_name, sum(rec_td) as tds
    from players, stats, positions, players2positions
    where  players.id = stats.playerID
    and players.id = players2positions.playerid
    and players2positions.positionID = positions.id
    and position like "WR"
    and year = 2021
    group by p_name
    order by tds desc
    limit 1) as wr,

(select p_name, sum(rush_td) as tds
    from players, stats, positions, players2positions
    where  players.id = stats.playerID
    and players.id = players2positions.playerid
    and players2positions.positionID = positions.id
    and position = "RB"
    and year = 2021
    group by p_name
    order by tds desc
    limit 1) as rb