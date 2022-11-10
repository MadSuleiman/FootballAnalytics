SELECT'________________________________________________________________________';
SELECT'14. Players at Multiple Positions in 2021';
SELECT'________________________________________________________________________';
select p_name, position
    from players, players2positions, positions
    where players.id  = playerID
    and positionID = positions.Id 
    and year = 2021
    and players.ID in (
        select playerID
            from players2positions
            where year = 2021
            group by playerID
            having count(*) >= 2
        )
    group by p_name, position
;