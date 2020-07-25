from flask_restful import Resource

class Account(Resource):
    
    #handles the get requests
    def get(self):
        return {"message": "This is the account, welcome!"}

    