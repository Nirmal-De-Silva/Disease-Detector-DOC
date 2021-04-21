import cv2
import numpy as np
import tensorflow as tf

import operator

# CATEGORIES = ['Chalazion' , 'Uveitis','Blepharitis',  'Cellulitis eye', 'Conjunctivitis(Pink Eye)', 'Dacryocytitis',
#               'Endophthalmitis', 'Entropion', 'Hordeolum(stye)',
#               'Internal Hordeolum', 'Keratitis', 'Ocular Herpes', 'Orbital cellulitis', 'Preseptal Cellulitis',
#               'strabismus', 'Stye']

filepath = "F:\Academic\SPGP\Test_Deasese"

# # DATADIRECTORY = "F:\Academic\SPGP\Test_Deasese"
# # # CATEGORIES = ['Blepharitis', 'Cellulitis eye']
CATEGORIES = ['Cataract','Chalazion', 'Keratitis','Normal eye','Stye' , 'Uveitis' ]






def prepare(filepath):

    IMG_SIZE = 28  # 50 in txt-based
    img_array = cv2.imread(filepath, cv2.IMREAD_GRAYSCALE)
    new_array = cv2.resize(img_array, (IMG_SIZE, IMG_SIZE))/255.0
    return new_array.reshape(-1, IMG_SIZE, IMG_SIZE, 1)


model = tf.keras.models.load_model("Eye-model1")

prediction = model.predict([prepare('F:\Academic\SPGP\Test_Deasese\\o3.jpg')])
print(prediction)  # will be a list in a list.
result = np.argmax(prediction)
print(result)
# maxV = prediction[0]
# for i in prediction:
#     if maxV < i:
#         maxV = i
# print(maxV)

print(CATEGORIES[result])