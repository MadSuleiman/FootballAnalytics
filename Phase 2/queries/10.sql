SELECT'________________________________________________________________________';
SELECT'10. Recievers organized by recieving TDs';
SELECT'________________________________________________________________________';

select p_name, sum(rec_td) as tds
    from players, players2positions, positions, stats
    where players.id = players2positions.playerID 
    and players.ID = stats.playerID
    and players2positions.positionID = positions.id
    and position like "WR"
    group by p_name
    order by tds desc

;