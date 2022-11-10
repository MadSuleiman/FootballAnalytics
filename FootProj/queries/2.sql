
SELECT'________________________________________________________________________';
SELECT'2. List all players from the Cleveland Browns (CLE) and Philadelphia Eagles (PHI) List the player alphabetically and the team';
SELECT'________________________________________________________________________';
SELECT p_name, t_team FROM players, teams
WHERE p_team=t_team
AND (t_team="CLE" OR t_team="PHI")
ORDER BY p_name;