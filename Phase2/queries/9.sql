SELECT'________________________________________________________________________';
SELECT'9. Get quarterbacks and average pass yards, sorted by average pass yards';
SELECT'________________________________________________________________________';

select p_name, ROUND(avg(pass_yds),2) as yds
    from players, players2positions, positions, stats
    where players.id = players2positions.playerID 
    and players2positions.playerID = stats.playerID
    and positionID = positions.id
    and position = "QB"
    group by p_name
    ORDER BY yds DESC

;