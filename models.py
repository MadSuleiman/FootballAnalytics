import sqlalchemy as db
from sqlalchemy.orm import sessionmaker

import os

engine = db.create_engine("sqlite:///main.db")
metadata = db.MetaData()
# Session = sessionmaker(engine)

# Load our sh file for db creation (temp)
os.popen('sh ./createload.sh')

class players():
    __tablename__ = 'players'
    id = db.Column(db.String)
    p_name = db.Column(db.String)
    p_team = db.Column(db.String)

class positions():
    __tablename__ = 'positions'
    id = db.Column(db.Integer, nullable = False, primary_key = True),
    position = db.Column(db.String)

class players2Positions():
    __tablename__ = 'players2Positions'
    playerID = db.Column(db.Integer, nullable = False),
    positionID = db.Column(db.Integer, nullable = False),
    year = db.Column(db.Date)

class stats():
    __tablename__ = 'stats'
    playerID = db.Column(db.String, nullable = False)
    gameID = db.Column(db.String, nullable = False)
    pass_cmp = db.Column(db.Integer, default = 0)
    pass_att = db.Column(db.Integer, default = 0)
    pass_yds = db.Column(db.Integer, default = 0)
    pass_td = db.Column(db.Integer, default = 0)
    pass_int = db.Column(db.Integer, default = 0)
    pass_sacked = db.Column(db.Integer, default = 0)
    pass_sacked_yds = db.Column(db.Integer, default = 0)
    pass_long = db.Column(db.Integer, default = 0)
    pass_rating = db.Column(db.Integer, default = 0)
    rush_att = db.Column(db.Integer, default = 0)
    rush_yds = db.Column(db.Integer, default = 0)
    rush_td = db.Column(db.Integer, default = 0)
    rush_long = db.Column(db.Integer, default = 0)
    targets = db.Column(db.Integer, default = 0)
    rec = db.Column(db.Integer, default = 0)
    rec_yds = db.Column(db.Integer, default = 0)
    rec_td = db.Column(db.Integer, default = 0)

class teams():
    __tablename__ = 'teams'
    id = db.Column(db.String, primary_key = True)
    t_team = db.Column(db.String) 

class games():
    __tablename__ = 'games'
    id = db.Column(db.String) 
    home_score = db.Column(db.Integer)
    vis_score = db.Column(db.Integer)
    date = db.Column(db.Date)

class teams2Games():
    __tablename__ = 'teams2Games'
    team1ID = db.Column(db.Integer)
    team2ID = db.Column(db.Integer)
    gameID = db.Column(db.String)

class divisions():
    __tablename__ = 'divisions'
    id = db.Column(db.String)
    d_name = db.Column(db.String)
    d_team = db.Column(db.String)

class coaches():
    __tablename__ = 'coaches'
    id = db.Column(db.String)
    c_name = db.Column(db.String)
    c_team = db.Column(db.String)
    c_age = db.Column(db.Integer)
    c_winPercent = db.Column(db.Float)
    c_hired = db.Column(db.Integer)

class allData():
    __tablename__ = 'allData'
    gameID = db.Column(db.String, nullable = False)
    playerID = db.Column(db.String, nullable = False)
    pos = db.Column(db.String)
    player = db.Column(db.String)
    team = db.Column(db.String)
    pass_cmp = db.Column(db.Integer, default = 0)
    pass_att = db.Column(db.Integer, default = 0)
    pass_yds = db.Column(db.Integer, default = 0)
    pass_td = db.Column(db.Integer, default = 0)
    pass_int = db.Column(db.Integer, default = 0)
    pass_sacked = db.Column(db.Integer, default = 0)
    pass_sacked_yds = db.Column(db.Integer, default = 0)
    pass_long = db.Column(db.Integer, default = 0)
    pass_rating = db.Column(db.Integer, default = 0)
    rush_att = db.Column(db.Integer, default = 0)
    rush_yds = db.Column(db.Integer, default = 0)
    rush_td = db.Column(db.Integer, default = 0)
    rush_long = db.Column(db.Integer, default = 0)
    targets = db.Column(db.Integer, default = 0)
    rec = db.Column(db.Integer, default = 0)
    rec_yds = db.Column(db.Integer, default = 0)
    rec_td = db.Column(db.Integer, default = 0)

def getAll():
    with engine.connect() as conn:
        x = conn.execute("select * from allData").fetchall()
        return x

def statsByPlayer():
    with engine.connect() as conn:
        x = conn.execute("select p_name, players.p_team, sum(pass_cmp), sum(pass_att), sum(pass_yds), sum(pass_td), sum(pass_int), sum(pass_sacked), sum(pass_sacked_yds), sum(pass_long),sum(pass_rating), sum(rush_att), sum(rush_yds), sum(rush_td), sum(rush_long), sum(targets), sum(rec), sum(rec_yds), sum(rec_td) from players, stats where players.id = stats.playerID group by p_name, players.p_team;").fetchall()
        return x
