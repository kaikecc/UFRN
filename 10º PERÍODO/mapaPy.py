import numpy as np
import math
from sklearn import preprocessing
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np


path = '/content/mapa.csv'
mapa = pd.read_csv(path)
mapa.columns=['x', 'y']
m = mapa[mapa.x != -9]

A = np.zeros((20, 20))

for index, row in m.iterrows():
   
   if row['x'] > 0 and row['y'] > 0 :      # Primeiro Quadrante
     i = 11 - math.ceil((row['y']/(2.5))*10)
     j = 10 + math.ceil((row['x']/(2.5))*10)
   elif row['x'] < 0 and row['y'] > 0 :    # Segundo Quadrante
     i = 11 - math.ceil((row['y']/(2.5))*10)
     j = 13 - (math.ceil((row['x']/(-2.5))*10) + 2)
   elif row['x'] < 0 and row['y'] < 0 :    # Terceiro Quadrante
     i = 10 + math.ceil((row['y']/(-2.5))*10)
     j = 13 - (math.ceil((row['x']/(-2.5))*10) + 2)
   else:                                   # Quarto Quadrante
     i = 10 + math.ceil((row['y']/(-2.5))*10)
     j = 10 + math.ceil((row['x']/(2.5))*10)

   A[i][j] = A[i][j] + 0.5

A = preprocessing.normalize(A, norm="l1")

im = plt.imshow(A, cmap='hot')
plt.colorbar(im, orientation='horizontal')
plt.show()
