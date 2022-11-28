from flask import Flask, render_template, request, redirect, url_for, abort, session
from flask_session import Session

app = Flask(__name__)

app.config.from_pyfile('creds.py')

app.config['DEBUG'] = True
app.config['PDF_DIR_LOC'] = './app/static/'
app.config['PDF_DIR'] = './pdf/' 
app.config['DB_PATH'] = './app/sql/'
app.config['MAX_CONTENT_LENGTH'] = 10 * 1024 * 1024 #10 Mo size max for upload
# app.config['ALLOW_UPLOAD'] = False
app.config['ALLOW_UPLOAD'] = True
#app.config['ALLOW_DELETE'] = True
app.config['ALLOW_DELETE'] = False

#
app.config['RESEARCH_GROUP'] = ""
app.config['INSTITUTION'] = "Institute of Computer Science, University of the Philippines Los Baños"
app.config['SESSION_PERMANENT'] = False
app.config['SESSION_TYPE'] = 'filesystem'
Session(app)

print("Server listening on http://localhost:5000")

from app import views

