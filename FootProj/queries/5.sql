SELECT'________________________________________________________________________';
SELECT '5. Retreive all player data summed up by player';
SELECT'________________________________________________________________________';

select p_name, players.p_team, sum(pass_cmp), sum(pass_att), sum(pass_yds), sum(pass_td), sum(pass_int), sum(pass_sacked), sum(pass_sacked_yds), sum(pass_long),sum(pass_rating), sum(rush_att), sum(rush_yds), sum(rush_td), sum(rush_long), sum(targets), sum(rec), sum(rec_yds), sum(rec_td)
    from players, stats
    where players.id = stats.playerID
    group by p_name, players.p_team;