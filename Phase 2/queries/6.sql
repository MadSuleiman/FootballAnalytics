SELECT'________________________________________________________________________';
SELECT'6. Games where a team was outscored by atleast 20';
SELECT'________________________________________________________________________';

select t1.t_team, t2.t_team, gameID, abs(home_score-vis_score) as diff
    from teams as t1, teams as t2, teams2games, games
        where t1.id = team1ID
        and t2.id = team2ID
        and t1.id != t2.id
        and gameID = games.id
        and diff >= 20
;