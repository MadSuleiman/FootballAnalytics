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
    playerID string,
    name string,
    teamID integer
);

CREATE TABLE stats(
    playerID integer not NULL,
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
    positionID integer PRIMARY key AUTOINCREMENT 
);

CREATE TABLE teams(
    teamID integer PRIMARY key AUTOINCREMENT,
    name string, 
    city string,
    color1 string,
    color2 string
);

CREATE TABLE divisions(
    divisionID integer PRIMARY key AUTOINCREMENT,
    teamID integer not NULL
);

CREATE TABLE coaches(
    coachID integer PRIMARY key AUTOINCREMENT,
    name string,
    age integer,
    winPercentage integer
);

CREATE TABLE games(
    gameID integer PRIMARY key AUTOINCREMENT,
    score integer,
    date dateTime 
);

-- Our first many to many table
CREATE TABLE players2Positions(
    playerID integer not NULL,
    positionID integer not NULL,
    year dateTime
);

-- Our second many to many table
CREATE TABLE teams2Games(
    team1ID integer not NULL,
    team2ID integer not NUll,
    gameID integer not NULL
);

.mode "csv"
.separator ","
.headers off

-- Importing every tbl file integero a samely named sql table. 
.import './data/players.csv' allData