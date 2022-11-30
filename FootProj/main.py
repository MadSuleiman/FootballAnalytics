from sqlalchemy import create_engine, Column, ForeignKey, Integer, String
from sqlalchemy.orm import declarative_base, relationship

engine = create_engine("sqlite:////main.db")

