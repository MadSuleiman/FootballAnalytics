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

@app.route("/players/<name>", )
def playersName(name):
    p = models.playerByName(name)[0]
    print(p)
    g = models.playerByName(name)
    return render_template("playerView.html", p=p, games = g)

@app.route("/players/<name>/<order>", )
def playersNameOrd(name, order):
    data = models.playerByName(name)
    if data:
        p = models.playerByName(name)[0]
        g = models.playerByName(name, " order by " + order + " desc")
        return render_template("playerView.html", p=p, games = g)
    

@app.route("/players/order/<order>", )
def playersOrder(order):
    p = models.playerStats("order by "+ order + " desc ")
    
    return render_template("players.html", players = p)

@app.route("/player", )
def player():
    return redirect(url_for("/players"))

@app.route("/teams", )
def teams():
    t = models.teamRecord()
    return render_template("teams.html", teams = t)

@app.route("/teams/<order>", )
def teamsOrder(order):
    t = models.teamRecord(order)
    return render_template("teams.html", teams = t)

@app.route("/teams/<name>", )
def teamsName(name):
    t = models.teamRecord()
    return render_template("teams.html", teams = t)


@app.route("/games", )
def games():
    g = models.statsByGame()
    print(g)
    
    return render_template("games.html", games = g)

if __name__ == '__main__':
    app.run()