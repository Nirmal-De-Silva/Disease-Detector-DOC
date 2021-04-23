from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def index():
    return jsonify({'chat' : 'Hello Chatbot'})



if __name__ == "__main__":
    app.run(debug = False, host = '127.0.0.1', port =5003)

