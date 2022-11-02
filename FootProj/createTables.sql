DROP TABLE players;
DROP TABLE stats;
DROP TABLE positions;
DROP TABLE teams;
DROP TABLE divisions;
DROP TABLE coaches;
DROP TABLE games;
DROP TABLE players2positions;
DROP TABLE teams2games;

CREATE TABLE players(
    playerID int PRIMARY key not NULL,
    teamID int
);

CREATE TABLE stats(
    playerID int not NULL,
    pass_cmp int default 0,
    pass_att int default 0,
    pass_yds int default 0,
    pass_td int default 0,
    pass_int int default 0,
    pass_sacked int default 0,
    pass_sacked_yds int default 0,
    pass_long int default 0,
    pass_rating int default 0,
    rush_att int default 0,
    rush_yds int default 0,
    rush_td int default 0,
    rush_long int default 0,
    targets default 0,
    rec int default 0,
    rec_yds int default 0,
    rec_td int default 0
);

CREATE TABLE positions(
    positionID int PRIMARY key not NULL
);

CREATE TABLE teams(
    teamID int PRIMARY key not NULL,
    name string, 
    city string,
    color1 string,
    color2 string
);

CREATE TABLE divisions(
    divisionID int PRIMARY key not NULL,
    teamID int not NULL
);

CREATE TABLE coaches(
    coachID int PRIMARY key not NULL,
    name string,
    age int,
    winPercentage int
);

CREATE TABLE games(
    gameID int PRIMARY key not NULL,
    score int,
    date dateTime 
);

-- Our first many to many table
CREATE TABLE players2Positions(
    playerID int not NULL,
    positionID int not NULL,
    year dateTime
);

-- Our second many to many table
CREATE TABLE teams2Games(
    team1ID int not NULL,
    team2ID int not NUll,
    gameID int not NULL
);