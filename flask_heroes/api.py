#!/usr/bin/python3

import sys, os

sys.path.append(os.path.dirname(os.path.realpath(__file__))+'/models')
from flask import Flask
from flask import jsonify
from flask_restful import Resource, Api

from hero import Hero


app = Flask(__name__)
api = Api(app)

@app.route('/')
def hello_world():
    my_hero = Hero(1,"PyMan")
    return jsonify(my_hero.serialize())


#class HelloWorld(Resource):
#    def get(self):
#        return {'hello': 'world'}

#api.add_resource(HelloWorld, '/')

if __name__ == '__main__':
    app.run(debug=True,port=3000)

