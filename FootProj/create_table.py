from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData

engine = create_engine("sqlite:////main.db")
meta = MetaData()
