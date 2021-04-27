#performing flask imports
from flask import Flask,jsonify
from flask_cors import CORS


app = Flask(__name__) #intance of our flask application
CORS(app)


#Route '/' to facilitate get request from our flutter app
@app.route('/', methods = ['GET'])
def index():
    return jsonify({'greetings' : 'Hi! this is '}) #returning key-value pair in json format


if __name__ == "__main__":
    app.run(debug = False, host = '127.0.0.1' , port = 45998) #debug will allow changes without shutting down the server 

