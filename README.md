# simple_api_app

With this project I wanted to gain experience with programming a simple Full Stack mobile application using a combination of Flutter/Dart for the front end and Python for the REST API on the backend.

## Getting Started
Before running this application you must first initialise the REST API on your own machine. Download this project and navigate to the REST_API directory. When in this folder run the following command in a terminal/cmd window.

- code .bash_profile

Once the .bash_profile file has opened, enter the following line (replacing the value with your database URI connection string)

- export DB_CONN_STRING='ENTER_YOUR_DB_URI_HERE'

Save the file and run the following command to ensure the changes have been registered

- source .bash_profile

Now that the connection to the database has been established you are now able to run the REST API Server and launch the app.

# Run Server
- open a terminal tab and navigate into the REST_API folder in this project
- create a virtual env using 'virtualenv env'
- enter the env by running 'source env/bin/activate'
- install all requirements by running 'pip3 install -r requirements.txt'
- finall run the server 'python run.py'

# Launch the app
- launch the app by opening a device simulator or connecting your mobile device
- run 'flutter run'

# ENJOY!!
You can now begin using the tool and begin adding users to the database using the 'New User' section and view them under the 'View User' section. 


