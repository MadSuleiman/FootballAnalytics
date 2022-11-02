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
    playerID int PRIMARY key not NULL
);

CREATE TABLE stats(
    playerID int not NULL
);

CREATE TABLE positions(
    positionID int PRIMARY key not NULL
);

CREATE TABLE teams(
    teamID int PRIMARY key not NULL

);

CREATE TABLE divisions(
    divisionID int PRIMARY key not NULL
);

CREATE TABLE coaches(
    coachID int PRIMARY key not NULL
);

CREATE TABLE games(
    gameID int PRIMARY key not NULL
);

-- Our first many to many table
CREATE TABLE players2Positions(
    playerID int not NULL,
    positionID int not NULL
);

-- Our second many to many table
CREATE TABLE teams2Games(
    teamID int not NULL,
    gameID int not NULL
);