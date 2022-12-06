import tkinter as tk
import models
# Create window
window = tk.Tk()
window.title('Football Analytics')
window.iconbitmap("nfl.ico")

# Design goes here
window.geometry("1000x700")
window.configure(background="white")

frame = tk.Frame(window)
frame.pack()

# create a menubar
menubar = tk.Menu(window)
window.config(menu=menubar)

# create the file_menu
file_menu = tk.Menu(
    menubar,
    tearoff=0
)

# add menu items to the File menu
file_menu.add_command(label='Close')
file_menu.add_separator()

# add a submenu
sub_menu = tk.Menu(file_menu, tearoff=0)
# sub_menu.add_command(label='Keyboard Shortcuts')

# add the File menu to the menubar
# file_menu.add_cascade(
#     label="Preferences",
#     menu=sub_menu
# )

# add Exit menu item
file_menu.add_separator()
file_menu.add_command(
    label='Exit',
    command=window.destroy
)

menubar.add_cascade(
    label="File",
    menu=file_menu,
    underline=0
)
# create the Help menu
help_menu = tk.Menu(
    menubar,
    tearoff=0
)

help_menu.add_command(label='Welcome')
help_menu.add_command(label='About...')

# add the Help menu to the menubar
menubar.add_cascade(
    label="Help",
    menu=help_menu,
    underline=0
)

# Enter event loop to read user input
window.mainloop()
