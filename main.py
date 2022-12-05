from sqlalchemy import create_engine, Column, ForeignKey, Integer, String
from sqlalchemy.orm import declarative_base, relationship
import tkinter as tk
engine = create_engine("sqlite:////main.db")

# Create window
window = tk.Tk()

# Design goes here


# Enter event loop to read user input
window.mainloop()
