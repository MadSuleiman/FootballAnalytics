import tkinter as tk
import models

# Create window
window = tk.Tk()

# Design goes here
frame = tk.Frame(window)
frame.pack()

redbutton = tk.Button(frame, text="Red", fg="red")
redbutton.pack()

greenbutton = tk.Button(frame, text="Brown", fg="brown")
greenbutton.pack()

bluebutton = tk.Button(frame, text="Blue", fg="blue")
bluebutton.pack()

# Enter event loop to read user input
window.mainloop()
