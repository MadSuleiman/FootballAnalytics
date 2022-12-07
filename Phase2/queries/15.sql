SELECT'________________________________________________________________________';
SELECT'15. Find games between teams in the same division. List the teams, the division, and game date';
SELECT'________________________________________________________________________';
select t1.t_team, t2.t_team, d1.d_name,date
    from teams as t1, teams as t2, divisions as d1, divisions as d2, teams2Games, games
    where t1.t_team = d1.d_team
    and t2.t_team = d2.d_team
    and d1.d_name = d2.d_name
    and t1.t_team != t2.t_team
	and teams2Games.gameID=games.id
	and t1.id=teams2Games.team1ID
	and t2.id=teams2Games.team2ID
	