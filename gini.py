# Import libraries
import numpy as np
import pandas as pd
import os
import matplotlib.pyplot as plt

#A figure is created to show Gini ımpurity measures 
plt.figure()
x = np.linspace(0.01,1)
y = 1 - (x*x) - (1-x)*(1-x) 
plt.plot(x,y)
plt.title('Gini Impurity')
plt.xlabel("Fraction of Class k ($p_k$)")
plt.ylabel("Impurity Measure")
plt.xticks(np.arange(0,1.1,0.1))

plt.show()

# Defining a simple dataset
attribute_names =  ['weakness', 'polyphagia','Genital thrush', 'blurring']
class_name = 'default'
data1 =pd.read_csv('D:/Grace/data.xlsx')
df1 = pd.DataFrame (data1, columns=data1.keys())
print(df1)

# STEP 1: Calculate gini(D)
def gini_impurity (value_counts):
    n = value_counts.sum()
    p_sum = 0
    for key in value_counts.keys():
        p_sum = p_sum  +  (value_counts[key] / n ) * (value_counts[key] / n ) 
    gini = 1 - p_sum
    return gini

class_value_counts = df1[class_name].value_counts()
print(f'Number of samples in each class is :\n{class_value_counts}')

gini_class = gini_impurity(class_value_counts)
print(f'\nGini Impurity of the class is {gini_class:.3f}')




