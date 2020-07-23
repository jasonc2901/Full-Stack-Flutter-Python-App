from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    
    id = db.Column(db.Integer(), primary_key=True, unique=True)
    api_key = db.Column(db.String(),unique=True)
    username = db.Column(db.String())
    first_name = db.Column(db.String())
    last_name = db.Column(db.String())
    password = db.Column(db.String())
    email_address = db.Column(db.String())
    image_url = db.Column(db.String())

    def __init__(self,api_key,username,first_name,last_name,password,email_address, image_url):
        self.api_key = api_key
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.password = password
        self.email_address = email_address
        self.image_url = image_url

    def __repr__(self):
        return '<id {}>'.format(self.id)

    
    def serialize(self):
        return {
            'id' : self.id,
            'api_key' : self.api_key,
            'username' : self.username,
            'first_name' : self.first_name,
            'last_name' : self.last_name,
            'password' : self.password,
            'email_address' : self.email_address,
            'image_url' : self.image_url
        }


class UserSchema(ma.Schema):
    id = fields.Integer()
    api_key = fields.String(required=True)
    username = fields.String(required=True)
    first_name = fields.String(required=True)
    last_name = fields.String(required=True)
    password = fields.String(required=True)
    email_address = fields.String(required=True)
    image_url = fields.String(required=True)
    
    
