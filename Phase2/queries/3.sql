SELECT'________________________________________________________________________';
SELECT'3. List all players from NFC West (NFCW) division. List the player alphabetically and the team they play for';
SELECT'________________________________________________________________________';
SELECT p_name, t_team FROM players, teams, divisions
WHERE p_team=t_team
AND d_team=t_team
AND d_name="NFCW"
ORDER BY p_name;