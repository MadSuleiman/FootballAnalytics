-- Retreive all player data summed up by player
select p_name, players.teamID, sum(pass_cmp), sum(pass_att), sum(pass_yds), sum(pass_td), sum(pass_int), sum(pass_sacked), sum(pass_sacked_yds), sum(pass_long),sum(pass_rating), sum(rush_att), sum(rush_yds), sum(rush_td), sum(rush_long), sum(targets), sum(rec), sum(rec_yds), sum(rec_td)
    from players, stats
    where players.id = stats.playerID
    group by p_name, players.teamID;

-- games where a team was outscored by atleast 20
select t1.t_name, t2.t_name, gameID, abs(home_score-vis_score) as diff
    from teams as t1, teams as t2, teams2games, games
        where t1.id = team1ID
        and t2.id = team2ID
        and t1.id != t2.id
        and gameID = games.id
        and diff >= 20
;
-- get player names and positions, organized by position
select p_name, position
    from players, players2positions, positions
    where players.id = playerID
    and positionID = positions.id
    order by position


;

-- get player names of a certain position
select distinct p_name, position
    from players, players2positions, positions
    where players.id = playerID
    and positionID = positions.id
    and position = "QB"
    order by p_name


;

--get quarterbacks and average pass yards
select p_name, avg(pass_yds) as yds
    from players, players2positions, positions, stats
    where players.id = players2positions.playerID 
    and players2positions.playerID = stats.playerID
    and positionID = positions.id
    and position = "QB"
    group by p_name

;

-- Recievers organized by recieving TDs
select p_name, sum(rec_td) as tds
    from players, players2positions, positions, stats
    where players.id = players2positions.playerID 
    and players.ID = stats.playerID
    and positionID = positions.id
    and position like "WR"
    group by p_name
    order by tds desc

;

-- Pull team wins/losses
-- select t_name, count(distinct games.id)
--     from teams, teams2games, games
--     where teams.id = teams2games.team1ID
--     or teams.id = teams2games.team2ID
--     and teams2games.gameID = games.id

--     group by t_name

