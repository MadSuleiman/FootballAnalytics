SELECT'________________________________________________________________________';
SELECT'11. Teams Wins/Losses at home';
SELECT'________________________________________________________________________';
-- Pull team wins/losses
select t1.name, t1.wins, t2.losses from
    (
    select t_team as name, count(distinct games.id) as wins
        from teams, teams2games, games
        where (teams.id = teams2games.team1ID
        and home_score > vis_score)
        -- or (teams.id = teams2games.team2ID
        -- and vis_score > home_score)
        and teams2games.gameID = games.id

        group by t_team
    ) as t1
    left join
    (
    select t_team as name, count(distinct games.id) as losses
        from teams, teams2games, games
        where (teams.id = teams2games.team1ID
        and home_score < vis_score)
        -- or (teams.id = teams2games.team2ID
        -- and vis_score < home_score)
        and teams2games.gameID = games.id

        group by t_team
    ) as t2  
    on (t1.name = t2.name);