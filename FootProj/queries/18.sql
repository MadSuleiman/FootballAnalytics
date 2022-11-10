SELECT'________________________________________________________________________';
SELECT'18. Find players who arent quarterbacks whose name contain a "John" somewhere. List their position as well';
SELECT'________________________________________________________________________';

SELECT DISTINCT p_name, position FROM players, players2Positions, positions
WHERE players.id=players2Positions.playerID
AND positions.id=players2Positions.positionID 
AND position!="QB"
AND p_name LIKE "%JOHN%"
