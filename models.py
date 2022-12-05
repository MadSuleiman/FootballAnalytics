import sqlalchemy as db
import os

engine = db.create_engine("sqlite:///main.db")
metadata = db.MetaData()

# Load our sh file for db creation (temp)
os.popen('sh ./createload.sh')
