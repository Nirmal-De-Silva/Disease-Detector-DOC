import numpy as np
import os
import cv2
import pickle



DATADIRECTORY = "TrainData"

CATEGORIES = ['Cataract','Chalazion', 'Keratitis','Normal eye','Stye' , 'Uveitis' ]


training_data = []
IMG_SIZE = 28

def create_training_data():
    for category in CATEGORIES:
        path = os.path.join(DATADIRECTORY, category)  # path to disease dir
        class_num = CATEGORIES.index(category)
        for img in os.listdir(path):
            try:
                img_array = cv2.imread(os.path.join(path, img), cv2.IMREAD_GRAYSCALE)
                new_array = cv2.resize(img_array, (IMG_SIZE, IMG_SIZE))
                training_data.append([new_array, class_num])
                # plt.imshow(new_array, cmap='gray')
                # plt.show()
                # print(new_array)
            except Exception as e:
                pass


create_training_data()
print(len(training_data))

X = []
y = []

for features, label in training_data:
    X.append(features)
    y.append(label)

X = np.array(X).reshape(-1, IMG_SIZE, IMG_SIZE, 1)

# Object Serialization
pickle_out = open("X.pickle", "wb")
pickle.dump(X, pickle_out)
pickle_out.close()

pickle_out = open("y.pickle", "wb")
pickle.dump(y, pickle_out)
pickle_out.close()

