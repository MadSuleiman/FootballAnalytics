import sqlalchemy as db

import os

engine = db.create_engine("sqlite:///main.db")
metadata = db.MetaData()

# Load our sh file for db creation (temp)
os.popen('sh ./createload.sh')

class players(db.Model):
    id = db.Column(db.String)
    p_name = db.Column(db.String)
    p_team = db.Column(db.String)

# class positions(db.Model):
#     id = db.Column(db.Integer, nullable = False, primary_key = True),
#     position = db.Column(db.String)

# class players2Positions(db.Model):
#     playerID = db.Column(db.Integer, nullable = False),
#     positionID = db.Column(db.Integer, nullable = False),


# class stats(db.Model):
#     id = db.Column(db.String) 

# class teams(db.Model):
#     id = db.Column(db.String) 

# class games(db.Model):
#     id = db.Column(db.String) 

# class teams2Games(db.Model):
#     id = db.Column(db.String) 

# class divisions(db.Model):
#     id = db.Column(db.String) 

# class coaches(db.Model):
#     id = db.Column(db.String) 

# class allData(db.Model):
#     id = db.Column(db.String) 