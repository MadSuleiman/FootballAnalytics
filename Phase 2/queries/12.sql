SELECT'________________________________________________________________________';
SELECT'12. For coaches hired before 2010, list passing yards by their primary QB in descending order, with their team name';
SELECT'________________________________________________________________________';
SELECT c_name, MAX(yds), c_team FROM(
select c_name, ROUND(avg(pass_yds),2) as yds, c_team
    from players, players2positions, positions, stats, coaches, teams
    where players.id = players2positions.playerID 
    and players2positions.playerID = stats.playerID
    and positionID = positions.id
    and position = "QB"
	and players.p_team=coaches.c_team
	and coaches.c_year_hired<=2010
    group by p_name
    ORDER BY yds DESC
)
GROUP by c_name
ORDER by MAX(yds) DESC;