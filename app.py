from flask import Flask, jsonify, request
from flask_restful import Resource, Api
from flask.cli import with_appcontext
import mysql.connector, click


user_name = "Ion Sorin-Alexandru"


db = mysql.connector.connect(host='sql11.freemysqlhosting.net',
                    database='sql11507799',
                     user='sql11507799',
                     passwd='RNSZX2cugp')

def db_pull(query):
    cursor = db.cursor(dictionary=True)
    cursor.execute(query) 
    return cursor.fetchall()


app = Flask(__name__)
api = Api(app)

class PersonalData(Resource):
    def get(self):
        global user_name

        query = "SELECT location, age, gender, mobile, linkedin, email, github, project FROM users where user_name = '{0}'".format(user_name)
        results = db_pull(query)[0]

        personal_data = {
            "user_name" : user_name,
            "location" : results['location'],
            "age" : results['age'],
            "gender" : results['gender'],
            "mobile" : results['mobile'],
            "linkedin" : results['linkedin'],
            "email" : results['email'],
            "github" : results['github'],
            "project" : results['project'],
        }
        return personal_data

@click.command(name='personal-data')
@with_appcontext
def personalData():
    data = PersonalData()
    print("\n\nPersonal Data Section:")
    print(data.get())


class Objectives(Resource):
    def get(self):
        global user_name

        query = "SELECT objectives FROM users where user_name = '{0}'".format(user_name)
        results = db_pull(query)[0]

        objectives = {
            "objectives" : results['objectives']
        }

        return objectives


@click.command(name='objectives')
@with_appcontext
def objectives():
    data = Objectives()
    print("\n\nObjectives Section:")
    print(data.get())


class KeySkills(Resource):
    def get(self):
        global user_name

        query = "SELECT a.id AS employment_id, a.position, a.job_start, a.job_end, c.company_name, c.company_location from employments AS a JOIN users AS b ON a.user_id = b.id JOIN employers AS c on a.employer_id = c.id where b.user_name = '{0}' ORDER BY a.id DESC".format(user_name)
        unparsed_employments = db_pull(query)
        employments = []
        
        for employment in unparsed_employments:
            query = "SELECT tasks from employments AS a JOIN employment_details  AS b ON a.id = b.employment_id JOIN users AS c ON a.user_id = c.id WHERE b.employment_id = {0} AND c.user_name = '{1}'".format(employment['employment_id'],user_name)
            tasks = []
            unparsed_tasks = db_pull(query)
            for task in unparsed_tasks:
                tasks.append(task['tasks'])
            temp = {
                "position" : employment['position'],
                "job_start" : employment['job_start'],
                "job_end" : employment['job_end'],
                "company_name" : employment['company_name'].replace('\r\n','<br>'),
                "company_location" : employment['company_location'],
                "tasks" : tasks
            }
            employments.append(temp)

        return employments


@click.command(name='key-skills')
@with_appcontext
def keySkills():
    data = KeySkills()
    print("\n\nKey Skills Section:")
    print(data.get())


class UniversityEducation(Resource):
    def get(self):
        global user_name

        query = "SELECT major, start, end, university from education AS a JOIN users AS b on a.user_id = b.id where b.user_name = '{0}' and type = 'school' ORDER BY a.id DESC".format(user_name)
        unparsed_education = db_pull(query)
        
        education = []
        for element in unparsed_education:
            temp = {
                "major" : element['major'],
                "start" : element['start'],
                "end" : element['end'],
                "university" : element['university']
            }
            education.append(temp)

        return education


@click.command(name='university-education')
@with_appcontext
def universityEducation():
    data = UniversityEducation()
    print("\n\nUniversity Education Section:")
    print(data.get())


class PrivateEducation(Resource):
    def get(self):
        global user_name

        query = "SELECT major, start, university from education AS a JOIN users AS b on a.user_id = b.id where b.user_name = '{0}' and type = 'course' ORDER BY a.id DESC".format(user_name)
        unparsed_education = db_pull(query)
        
        education = []
        for element in unparsed_education:
            temp = {
                "major" : element['major'],
                "start" : element['start'],
                "university" : element['university']
            }
            education.append(temp)

        return education


@click.command(name='private-education')
@with_appcontext
def privateEducation():
    data = PrivateEducation()
    print("\n\nPrivate Education Section:")
    print(data.get())


class Languages(Resource):
    def get(self):
        global user_name

        query = "SELECT languages from users  where user_name = '{0}'".format(user_name)
        unparsed_languages = db_pull(query)[0]
        
        languages = {
            "languages" : unparsed_languages['languages'].replace('\r\n','<BR>')
        }

        return languages


@click.command(name='languages')
@with_appcontext
def languages():
    data = Languages()
    print("\n\nLanguages Section:")
    print(data.get())



class DrivingLicense(Resource):
    def get(self):
        global user_name

        query = "SELECT driving_license from users  where user_name = '{0}'".format(user_name)
        unparsed_driving_license = db_pull(query)[0]
        
        result = {
            "driving_license" : unparsed_driving_license['driving_license']
        }

        return result


@click.command(name='driving-license')
@with_appcontext
def drivingLicense():
    data = DrivingLicense()
    print("\n\nDriving License Section:")
    print(data.get())


class PersonalInterests(Resource):
    def get(self):
        global user_name

        query = "SELECT personal_interests from users  where user_name = '{0}'".format(user_name)
        unparsed_personal_interests = db_pull(query)[0]
        
        result = {
            "personal_interests" : unparsed_personal_interests['personal_interests']
        }

        return result

@click.command(name='personal-interests')
@with_appcontext
def personalInterests():
    data = PersonalInterests()
    print("\n\nPersonal interests Section:")
    print(data.get())


app.cli.add_command(personalData)
app.cli.add_command(objectives)
app.cli.add_command(keySkills)
app.cli.add_command(universityEducation)
app.cli.add_command(privateEducation)
app.cli.add_command(languages)
app.cli.add_command(drivingLicense)
app.cli.add_command(personalInterests)


api.add_resource(PersonalData, '/personal-data')
api.add_resource(Objectives, '/objectives')
api.add_resource(KeySkills, '/key-skills')
api.add_resource(UniversityEducation, '/university-education')
api.add_resource(PrivateEducation, '/private-education')
api.add_resource(Languages, '/languages')
api.add_resource(DrivingLicense, '/driving-license')
api.add_resource(PersonalInterests, '/personal-interests')

if __name__ == "__main__":
    app.run(port=5000)