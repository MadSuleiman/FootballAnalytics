DROP TABLE players;
DROP TABLE stats;
DROP TABLE positions;
DROP TABLE teams;
DROP TABLE divisions;
DROP TABLE coaches;
DROP TABLE games;
DROP TABLE players2positions;
DROP TABLE teams2games;
DROP TABLE allData;

CREATE TABLE players(
    id string,
    p_name string,
    teamID integer
);

CREATE TABLE positions(
    id integer PRIMARY key,
    position string

);

-- Our first many to many table
CREATE TABLE players2Positions(
    playerID integer not NULL,
    positionID integer not NULL,
    year dateTime
);

CREATE TABLE stats(
    playerID string not NULL,
    gameID string not NULL,
    pass_cmp integer default 0,
    pass_att integer default 0,
    pass_yds integer default 0,
    pass_td integer default 0,
    pass_int integer default 0,
    pass_sacked integer default 0,
    pass_sacked_yds integer default 0,
    pass_long integer default 0,
    pass_rating integer default 0,
    rush_att integer default 0,
    rush_yds integer default 0,
    rush_td integer default 0,
    rush_long integer default 0,
    targets default 0,
    rec integer default 0,
    rec_yds integer default 0,
    rec_td integer default 0
);

CREATE TABLE teams(
    id integer PRIMARY key,
    t_name string--, 
    -- city string,
    -- color1 string,
    -- color2 string
);


CREATE TABLE games(
    id string,
    home_score integer,
    vis_score integer,
    date datetime 
);

-- Our second many to many table
CREATE TABLE teams2Games(
    team1ID integer,
    team2ID integer,
    gameID string
);

CREATE TABLE divisions(
    divisionID integer PRIMARY key,
    teamID integer not NULL
);

.mode "csv"
.separator ","
.headers off

-- Importing every tbl file integer as a samely named sql table. 
.import './data/players.csv' allData
.import './data/coaches.csv' coaches