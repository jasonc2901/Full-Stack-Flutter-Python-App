from flask import request
from flask_restful import Resource
from Model import db, User
import random
import string

class TweetResource(Resource):
    def get(self):
        return {
            "message" : "Success"
        }
