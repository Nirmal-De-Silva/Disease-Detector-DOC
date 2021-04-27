import os
from urllib import request
from flask import Flask, flash, request, redirect, url_for, render_template, jsonify
from werkzeug.utils import secure_filename, redirect
from predictDisease import prepare, predict
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])

# function to allowed file
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/', methods=['GET'])
def index():
    return jsonify({'disease': predict()})


@app.route('/upload', methods=['POST'])
def upload_image():
    filePath = ""
    if 'file' not in request.files:
        print('No file part')
        return filePath
    file = request.files['file'] #get files, key equel to "file"
    if file.filename == '': #file name equel to empty
        print('No image selected for uploading')
        output = 'No image selected for uploading'
        return output
    if file and allowed_file(file.filename): #get value(aploaded image)
        filename = "uploaded_image.jpg"
        filePath = os.path.join(os.getcwd(), "images", filename)
        file.save(filePath)
        print('Image successfully uploaded and displayed below')
        output = predict()
        return output
    else:
        flash('Allowed image types are -> png, jpg, jpeg, gif')
        output = 'Allowed image types are -> png, jpg, jpeg, gif'
        return output


if __name__ == "__main__":
    app.run(debug=False, host='127.0.0.1', port=5003)
