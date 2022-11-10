SELECT'1. List all players from the Miami Dolphins (MIA) And their position. Sort alphabetically';
SELECT'________________________________________________________________________';
SELECT DISTINCT p_name, position FROM players, teams, players2Positions, positions
WHERE p_team=t_team
AND t_team="MIA"
AND playerID=players.id
AND positions.id=players2Positions.positionID

ORDER by p_name;