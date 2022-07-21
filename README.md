In order to run the cli commands, you will have to have the virtualenv and the following libraries installed:
    - flask
    - flask_restful
    - mysql.connector
    - click

Start the virtualenv and provide the following command 'setx FLASK_APP "app.py"'

CLI commands:
1. flask personal-data - fetches the author's personal data
2. flask objectives - fetches the author's objectives
3. flask key-skills - fetches the key skills
4. flask university-education - fetches the university education
5. flask private-education - fetches the courses made
6. flask languages - fetches the known languages
7. flask driving-license - fetches the driving-license
8. flask personal-interests - fetches the author's personal interests


In spite of having read that you do not need any database integration, I created a database and populated some tables with all the necessary data, in order to make the application more dynamic. The database has been hosted on the internet at freemysqlhosting.net, so you do not need to install any mysql client on your environment. Still, the database has been exported as an SQL file, just in case you need it.

The application runs on localhost port 5000, and you may find below the created endpoints:

localhost:5000/personal-data
localhost:5000/objectives
localhost:5000/key-skills
localhost:5000/university-education
localhost:5000/private-education
localhost:5000/languages
localhost:5000/driving-license
localhost:5000/personal-interests