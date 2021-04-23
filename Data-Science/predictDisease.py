import cv2
import numpy as np
import tensorflow as tf



filepath = "images"

CATEGORIES = ['Cataract', 'Chalazion', 'Keratitis', 'Normal eye', 'Stye', 'Uveitis']


def prepare(filepath):
    IMG_SIZE = 28  # 50 in txt-based
    img_array = cv2.imread(filepath, cv2.IMREAD_GRAYSCALE)
    new_array = cv2.resize(img_array, (IMG_SIZE, IMG_SIZE)) / 255.0
    return new_array.reshape(-1, IMG_SIZE, IMG_SIZE, 1)

def predict():
    model = tf.keras.models.load_model("Eye-model")

    prediction = model.predict([prepare('images/uploaded_image.jpg')])
    #print(prediction)  # will be a list in a list.
    result = np.argmax(prediction)
    output = CATEGORIES[result]
    print(CATEGORIES[result])
    return output
