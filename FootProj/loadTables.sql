insert into players
    select distinct player_id, player, team
        from allData
