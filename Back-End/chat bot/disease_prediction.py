from tkinter import *
from tkinter import messagebox
import numpy as np
import pandas as pd

l1 = ['muscle_wasting','patches_in_throat','high_fever','extra_marital_contacts','chills','vomiting','sweating','headache','nausea','diarrhoea','muscle_pain','itching','skin_rash','fatigue','lethargy','loss_of_appetite','mild_fever','swelled_lymph_nodes',
    'malaise','red_spots_over_body','joint_pain','back_pain','pain_behind_the_eyes']

disease = ['AIDS', 'Malaria', 'Chicken pox', 'Dengue']

l2 = []
for x in range(0,len(l1)):
    l2.append(0)

# TESTING DATA
tr=pd.read_csv("Testing.csv")
tr.replace({'disease':{'AIDS':0,'AIDS':1,'AIDS':2,'AIDS':3,'AIDS':4,
'AIDS':5,'AIDS':6,'AIDS':7,'AIDS':8,'AIDS':9,'AIDS ':10,
'AIDS':11,'Malaria':12,
'Malaria':13,'Malaria':14,'Malaria':15,'Malaria':16,'Malaria':17,'Malaria':18,'Malaria':19,
'Malaria':20,'Malaria':21,'Chicken pox':22,'Chicken pox':23,'Chicken pox':24,'Chicken pox':25,
'Chicken pox':26,'Chicken pox':27,'Chicken pox':28,'Chicken pox':29,'Chicken pox':30,'Chicken pox':31,
'Dengue':32,'Dengue':33,'Dengue':34,'Dengue':35,
'Dengue':36,'Dengue':37,'Dengue':38,'Dengue':39,
'Dengue':40}},inplace=True)

X_test = tr[l1]
y_test = tr[["prognosis"]]
np.ravel(y_test)

# TRAINING DATA
df=pd.read_csv("Training.csv")

df.replace({'disease':{'AIDS':0,'AIDS':1,'AIDS':2,'AIDS':3,'AIDS':4,
'AIDS':5,'AIDS':6,'AIDS':7,'AIDS':8,'AIDS':9,'AIDS ':10,
'AIDS':11,'Malaria':12,
'Malaria':13,'Malaria':14,'Malaria':15,'Malaria':16,'Malaria':17,'Malaria':18,'Malaria':19,
'Malaria':20,'Malaria':21,'Chicken pox':22,'Chicken pox':23,'Chicken pox':24,'Chicken pox':25,
'Chicken pox':26,'Chicken pox':27,'Chicken pox':28,'Chicken pox':29,'Chicken pox':30,'Chicken pox':31,
'Dengue':32,'Dengue':33,'Dengue':34,'Dengue':35,
'Dengue':36,'Dengue':37,'Dengue':38,'Dengue':39,
'Dengue':40}},inplace=True)

X= df[l1]

y = df[["prognosis"]]
np.ravel(y)

def message():
    if (Symptom1.get() == "None" and  Symptom2.get() == "None" and Symptom3.get() == "None" and Symptom4.get() == "None" and Symptom5.get() == "None"):
        messagebox.showinfo("OPPS!!", "ENTER  SYMPTOMS PLEASE")
    else :
        NaiveBayes()

def NaiveBayes():
    from sklearn.naive_bayes import MultinomialNB
    gnb = MultinomialNB()
    gnb=gnb.fit(X,np.ravel(y))
    from sklearn.metrics import accuracy_score
    y_pred = gnb.predict(X_test)
    print(accuracy_score(y_test, y_pred))
    print(accuracy_score(y_test, y_pred, normalize=False))

    psymptoms = [Symptom1.get(),Symptom2.get(),Symptom3.get(),Symptom4.get(),Symptom5.get()]

    for k in range(0,len(l1)):
        for z in psymptoms:
            if(z==l1[k]):
                l2[k]=1

    inputtest = [l2]
    predict = gnb.predict(inputtest)
    predicted=predict[0]

    h='no'
    for a in range(0,len(disease)):
        if(disease[predicted] == disease[a]):
            h='yes'
            break

    if (h=='yes'):
        t3.delete("1.0", END)
        t3.insert(END, disease[a])
    else:
        t3.delete("1.0", END)
        t3.insert(END, "No Disease")

root = Tk()
root.title(" Disease Prediction From Symptoms")
root.configure()

Symptom1 = StringVar()
Symptom1.set(None)
Symptom2 = StringVar()
Symptom2.set(None)
Symptom3 = StringVar()
Symptom3.set(None)
Symptom4 = StringVar()
Symptom4.set(None)
Symptom5 = StringVar()
Symptom5.set(None)

w2 = Label(root, justify=LEFT, text=" Disease Prediction From Symptoms ")
w2.config(font=("Elephant", 30))
w2.grid(row=1, column=0, columnspan=2, padx=100)

NameLb1 = Label(root, text="")
NameLb1.config(font=("Elephant", 20))
NameLb1.grid(row=5, column=1, pady=10,  sticky=W)

S1Lb = Label(root,  text="Symptom 1")
S1Lb.config(font=("Elephant", 15))
S1Lb.grid(row=7, column=1, pady=10 , sticky=W)

S2Lb = Label(root,  text="Symptom 2")
S2Lb.config(font=("Elephant", 15))
S2Lb.grid(row=8, column=1, pady=10, sticky=W)

S3Lb = Label(root,  text="Symptom 3")
S3Lb.config(font=("Elephant", 15))
S3Lb.grid(row=9, column=1, pady=10, sticky=W)

S4Lb = Label(root,  text="Symptom 4")
S4Lb.config(font=("Elephant", 15))
S4Lb.grid(row=10, column=1, pady=10, sticky=W)

S5Lb = Label(root,  text="Symptom 5")
S5Lb.config(font=("Elephant", 15))
S5Lb.grid(row=11, column=1, pady=10, sticky=W)

lr = Button(root, text="Predict",height=2, width=20, command=message)
lr.config(font=("Elephant", 15))
lr.grid(row=15, column=1,pady=20)

OPTIONS = sorted(l1)

S1En = OptionMenu(root, Symptom1,*OPTIONS)
S1En.grid(row=7, column=2)

S2En = OptionMenu(root, Symptom2,*OPTIONS)
S2En.grid(row=8, column=2)

S3En = OptionMenu(root, Symptom3,*OPTIONS)
S3En.grid(row=9, column=2)

S4En = OptionMenu(root, Symptom4,*OPTIONS)
S4En.grid(row=10, column=2)

S5En = OptionMenu(root, Symptom5,*OPTIONS)
S5En.grid(row=11, column=2)

NameLb = Label(root, text="")
NameLb.config(font=("Elephant", 20))
NameLb.grid(row=13, column=1, pady=10,  sticky=W)

NameLb = Label(root, text="")
NameLb.config(font=("Elephant", 15))
NameLb.grid(row=18, column=1, pady=10,  sticky=W)

t3 = Text(root, height=2, width=30)
t3.config(font=("Elephant", 20))
t3.grid(row=20, column=1 , padx=10)

root.mainloop()
