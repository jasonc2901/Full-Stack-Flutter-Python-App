from flask import Blueprint
from flask_restful import Api
from resources.UserResource import UserResource 
from resources.TweetResource import TweetResource
from resources.account import Account

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(UserResource, '/user')
api.add_resource(TweetResource, '/tweet')
