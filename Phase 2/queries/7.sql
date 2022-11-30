SELECT'________________________________________________________________________';
SELECT'7. Get player names and positions, organized by position';
SELECT'________________________________________________________________________';

select p_name, position, p_team
    from players, players2positions, positions
    where players.id = playerID
    and positionID = positions.id
    order by position


;