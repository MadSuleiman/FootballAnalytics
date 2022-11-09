SELECT'1. List all players from the Miami Dolphins (MIA) And their position. Sort alphabetically';
SELECT'________________________________________________________________________';
SELECT DISTINCT p_name, position FROM players, teams, players2Positions, positions
WHERE p_team=t_team
AND t_team="MIA"
AND playerID=players.id
AND positions.id=players2Positions.positionID

ORDER by p_name;

SELECT'________________________________________________________________________';
SELECT'2. List all players from the Cleveland Browns (CLE) and Philadelphia Eagles (PHI) List the player alphabetically and the team';
SELECT'________________________________________________________________________';
SELECT p_name, t_team FROM players, teams
WHERE p_team=t_team
AND (t_team="CLE" OR t_team="PHI")
ORDER BY p_name;

SELECT'________________________________________________________________________';
SELECT'3. List all players from NFC West (NFCW) division. List the player alphabetically and the team they play for';
SELECT'________________________________________________________________________';
SELECT p_name, t_team FROM players, teams, divisions
WHERE p_team=t_team
AND d_team=t_team
AND d_name="NFCW"
ORDER BY p_name;

SELECT'________________________________________________________________________';
SELECT'4. List all coaches with a winning record. (Win percentage above 50%). List the coach, the team they coach, and their win%'; 
SELECT'________________________________________________________________________';
SELECT c_name, c_team, c_winPercentage
FROM coaches
WHERE c_winPercentage>=.500
ORDER BY c_winPercentage DESC;


SELECT'________________________________________________________________________';
SELECT '5. Retreive all player data summed up by player';
SELECT'________________________________________________________________________';


select p_name, players.p_team, sum(pass_cmp), sum(pass_att), sum(pass_yds), sum(pass_td), sum(pass_int), sum(pass_sacked), sum(pass_sacked_yds), sum(pass_long),sum(pass_rating), sum(rush_att), sum(rush_yds), sum(rush_td), sum(rush_long), sum(targets), sum(rec), sum(rec_yds), sum(rec_td)
    from players, stats
    where players.id = stats.playerID
    group by p_name, players.p_team;

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


SELECT'________________________________________________________________________';
SELECT'7. Get player names and positions, organized by position';
SELECT'________________________________________________________________________';
select p_name, position, p_team
    from players, players2positions, positions
    where players.id = playerID
    and positionID = positions.id
    order by position


;

SELECT'________________________________________________________________________';
SELECT'8. Get player names of a certain position';
SELECT'________________________________________________________________________';

select distinct p_name, position, p_team
    from players, players2positions, positions
    where players.id = playerID
    and positionID = positions.id
    and position = "QB"
    order by p_name


;
SELECT'________________________________________________________________________';
SELECT'9. Get quarterbacks and average pass yards, sorted by average pass yards';
SELECT'________________________________________________________________________';
select p_name, ROUND(avg(pass_yds),2) as yds
    from players, players2positions, positions, stats
    where players.id = players2positions.playerID 
    and players2positions.playerID = stats.playerID
    and positionID = positions.id
    and position = "QB"
    group by p_name
    ORDER BY yds DESC

;
SELECT'________________________________________________________________________';
SELECT'10. Recievers organized by recieving TDs';
SELECT'________________________________________________________________________';
select p_name, sum(rec_td) as tds
    from players, players2positions, positions, stats
    where players.id = players2positions.playerID 
    and players.ID = stats.playerID
    and players2positions.positionID = positions.id
    and position like "WR"
    group by p_name
    order by tds desc

;




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
    on (t1.name = t2.name)