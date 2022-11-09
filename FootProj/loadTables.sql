insert into players
    select distinct player_id, player, team
        from allData;

insert into stats
    select player_id, game_id, pass_cmp, pass_att, pass_yds, pass_td,pass_int, pass_sacked, pass_sacked_yds, pass_long,pass_rating, rush_att, rush_yds, rush_td, rush_long,targets, rec, rec_yds, rec_td
        from allData;

insert into positions(position)
    select distinct pos
        from allData;

insert into teams(t_team)
    select distinct home_team
        from allData;

insert into games
    select distinct game_id, home_score, vis_score, game_date
        from allData;

insert into players2positions
    select distinct player_id, positions.id, substr(game_date,-4,4)
        from positions, allData
        where allData.pos = positions.position;

insert into teams2games
    select distinct t1.id, t2.id, game_id
        from allData, teams as t1, teams as t2
        where t1.t_team= allData.home_team
        and t2.t_team = allData.vis_team