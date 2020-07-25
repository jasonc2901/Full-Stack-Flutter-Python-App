from flask import request, jsonify
from flask_restful import Resource
from Model import db, User, UserSchema
import random
import string
import json

users_schema = UserSchema(many=True)

class UserResource(Resource):
    def get(self):
        users = User.query.all()
        users_data = users_schema.dump(users).data
        userid = request.args.get('id',type = int)
        username = request.args.get('username', type = str)

        if not username:
            return {'status': 'all_existing_users', 'data': users_data, "number_of_users": len(users_data)}, 200
            
        for i in range(0, len(users_data)):
            if users_data[i]["username"] == username:
                return {'status': 200, 'data': users_data[i]}, 200

        return {'status': 400, 'data': 'No User found'},400
            
        
    def post(self):
        json_data = request.get_json(force=True)
        
        #validates that the username doesn't already exist
        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return {'message': 'User already exists'}, 400

        #validates that the email hasnt already been signed up
        user = User.query.filter_by(email_address=json_data['email_address']).first()
        if user:
            return {'message': 'Email already signed up!'}, 400

        api_key = self.generateApiKey()

        #makes sure api key is not already added in the database
        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return {'message': 'API Key already exists!'}, 400
        
        user = User(
            api_key=api_key,
            username=json_data['username'],
            first_name=json_data['first_name'],
            last_name=json_data['last_name'],
            password=json_data['password'],
            email_address=json_data['email_address'],
            image_url=json_data['image_url']
            )

        db.session.add(user)
        db.session.commit()

        result = User.serialize(user)

        return { "status": 200, "user": result}, 200
    
    def generateApiKey(self):
        key = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(24))
        return(key)