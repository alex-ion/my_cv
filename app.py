from flask import Flask, jsonify, request
from flask_restful import Resource, Api
import mysql.connector

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
    def get(self ):
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


class Objectives(Resource):
    def get(self):
        global user_name

        query = "SELECT objectives FROM users where user_name = '{0}'".format(user_name)
        results = db_pull(query)[0]

        objectives = {
            "objectives" : results['objectives']
        }

        return objectives


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



class Languages(Resource):
    def get(self):
        global user_name

        query = "SELECT languages from users  where user_name = '{0}'".format(user_name)
        unparsed_languages = db_pull(query)[0]
        
        languages = {
            "languages" : unparsed_languages['languages'].replace('\r\n','<BR>')
        }

        return languages


class DrivingLicense(Resource):
    def get(self):
        global user_name

        query = "SELECT driving_license from users  where user_name = '{0}'".format(user_name)
        unparsed_driving_license = db_pull(query)[0]
        
        result = {
            "driving_license" : unparsed_driving_license['driving_license']
        }

        return result



class PersonalInterests(Resource):
    def get(self):
        global user_name

        query = "SELECT personal_interests from users  where user_name = '{0}'".format(user_name)
        unparsed_personal_interests = db_pull(query)[0]
        
        result = {
            "personal_interests" : unparsed_personal_interests['personal_interests']
        }

        return result


api.add_resource(PersonalData, '/personal-data')
api.add_resource(Objectives, '/objectives')
api.add_resource(KeySkills, '/key-skills')
api.add_resource(UniversityEducation, '/university-education')
api.add_resource(PrivateEducation, '/private-education')
api.add_resource(Languages, '/languages')
api.add_resource(DrivingLicense, '/driving-license')
api.add_resource(PersonalInterests, '/personal-interests')

app.run(port=5000)