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

CREATE TABLE stats(
    playerID string not NULL,
    gameID string not NULL,
    pass_cmp integer default 0,
    pass_att integer default 0,
    pass_yds integer default 0,
    pass_td integer default 0,
    pass_integer integer default 0,
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

CREATE TABLE positions(
    id integer PRIMARY key,
    position string

);

CREATE TABLE teams(
    id integer PRIMARY key,
    t_name string--, 
    -- city string,
    -- color1 string,
    -- color2 string
);

CREATE TABLE divisions(
    divisionID integer PRIMARY key,
    teamID integer not NULL
);

CREATE TABLE coaches(
    coachID integer PRIMARY key,
    name string,
    age integer,
    winPercentage integer,
    team string
);

CREATE TABLE games(
    gameID string,
    home_score integer,
    vis_score integer,
    date datetime 
);

-- Our first many to many table
CREATE TABLE players2Positions(
    playerID integer not NULL,
    positionID integer not NULL,
    year dateTime
);

-- Our second many to many table
CREATE TABLE teams2Games(
    team1ID string,
    team2ID string,
    gameID string
);

.mode "csv"
.separator ","
.headers off

-- Importing every tbl file integero a samely named sql table. 
.import './data/players.csv' allData