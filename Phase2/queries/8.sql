SELECT'________________________________________________________________________';
SELECT'8. Get player names of a certain position';
SELECT'________________________________________________________________________';

select distinct p_name, position, p_team
    from players, players2positions, positions
    where players.id = playerID
    and positionID = positions.id
    and position = "QB"
    order by p_name;