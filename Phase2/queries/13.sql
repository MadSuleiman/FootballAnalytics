SELECT'________________________________________________________________________';
SELECT'13. Teams Wins/Losses';
SELECT'________________________________________________________________________';
-- Pull team wins/losses
select name, wins, losses, c_name, d_name from (
select t5.name as name, (t5.wins + t6.wins) as wins, t5.losses+t6.losses as losses from (
    select t1.name as name, t1.wins as wins, t2.losses as losses from
        (
        select t_team as name, count(distinct games.id) as wins
            from teams, teams2games, games
            where (teams.id = teams2games.team1ID
            and home_score > vis_score)
            and teams2games.gameID = games.id

            group by t_team
        ) as t1
        left join
        (
        select t_team as name, count(distinct games.id) as losses
            from teams, teams2games, games
            where (teams.id = teams2games.team1ID
            and home_score < vis_score)
            and teams2games.gameID = games.id

            group by t_team
        ) as t2  
        on (t1.name = t2.name)) as t5
    left join (
    select t1.name as name, t1.wins as wins, t2.losses as losses from
        (
        select t_team as name, count(distinct games.id) as wins
            from teams, teams2games, games
            where (teams.id = teams2games.team2ID
            and vis_score > home_score)
            and teams2games.gameID = games.id

            group by t_team
        ) as t1
        left join
        (
        select t_team as name, count(distinct games.id) as losses
            from teams, teams2games, games
            where (teams.id = teams2games.team2ID
            and vis_score < home_score)
            and teams2games.gameID = games.id

            group by t_team
        ) as t2  
        on (t1.name = t2.name)) as t6
    on t5.name = t6.name
), coaches, divisions 
    where c_team = name
    and d_team = name 