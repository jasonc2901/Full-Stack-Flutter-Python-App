import os

# You need to add your DB_CONN_STRING into your own .bash_profile inside of the /REST_API directory
basedir = os.path.abspath(os.path.dirname(__file__))
SQLALCHEMY_ECHO = False
SQLALCHEMY_TRACK_MODIFICATIONS = True
SQLALCHEMY_DATABASE_URI = os.environ.get('DB_CONN_STRING')