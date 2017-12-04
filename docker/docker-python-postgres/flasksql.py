# coding:utf-8

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://root:123456@pgdb/root'
db = SQLAlchemy(app)

class User(db.Model):
	__tablename__='users'
	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(80), unique=True)
	email = db.Column(db.String(80), unique=True)

	def __init__(self, username, email):
		self.username=username
		self.email=email

	def __repr__(self):
		return '<User %r>' % self.username
