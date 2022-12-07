from flask import request, url_for, redirect, jsonify, current_app, make_response, send_file, session, render_template
from app import create_app
import models
import os, json
app = create_app()

@app.route("/", )
def start(error='Invalid username or password'):
    return redirect(url_for('home'))

@app.route("/home", )
def home():

    return render_template("home.html")

@app.route("/players", )
def players():
    p = models.playerStats()
    
    return render_template("players.html", players = p)

@app.route("/teams", )
def teams():

    return render_template("teams.html")

if __name__ == '__main__':
    app.run()