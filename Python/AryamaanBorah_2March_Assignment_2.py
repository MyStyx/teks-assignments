#!/usr/bin/env python
# coding: utf-8

# #### 

# In[1]:


import sys
import hashlib
import os
import numpy as np
import random
import string


# In[2]:


#Q1
os.listdir()
os.walk('C:')

def hashfunc(f):
    textfiles = []
    hashfiles = []
    dupefiles = []
    dirpath = f
    for (dir_path, dir_names, files_name) in os.walk(dirpath):
        for files in files_name:
            if '.txt' in files:
                abs_url = os.path.join(dir_path, files)
                textfiles.append(abs_url)
                f = open(abs_url)
                try:
                    b = bytes(f.read(), 'utf-8')
                except:
                    pass
                else:
                    msg = hashlib.md5()
                    msg.update(b)
                    h = msg.hexdigest()
                    if h in hashfiles:
                        dupefiles.append(abs_url)
                    else:
                        hashfiles.append(h)
                finally:
                    f.close()
    if len(dupefiles) != 0:         
        print('These are the Duplicate text files found:')
        for x in dupefiles:
            print(x)
        print('Do you wish to delete these files? (Y/N)')
        val = input()
        if val == 'Y' or val == 'y':
            totalfiles = len(dupefiles)
            for x in dupefiles:
                try:
                    os.remove(x)
                except OSError as e:
                    print(e.strerror)
                else:
                    print('{} file(s) removed.'.format(totalfiles))
        else:
            print('No files removed.')
    else:
        print('No duplicates found.')
            
hashfunc(r'C:\Users\aborah\pytestfiles')


# In[3]:


#Q2
order = ['U', 'L', 'L', 'D', 'D', 'S']
pswd = ''
random.shuffle(order)
for x in order:
    if x == 'U':
        pswd += string.ascii_uppercase[random.randint(0, 26)]
    elif x == 'L':
        pswd += string.ascii_lowercase[random.randint(0, 26)]
    elif x == 'D':
        pswd += string.digits[random.randint(0, 9)]
    else:
        pswd += string.punctuation[random.randint(0, 32)]
print(pswd)


# In[4]:


#Q3
arr = [[1, 2, 3, 4],[5, 6, 7, 8],[9, 10, 11, 12],[13, 14, 15, 16]]
mat1 = np.array(arr)
print(mat1)
def prime(n):
    if n <= 1:
        return False
  
    for i in range(2, n):
        if n % i == 0:
            return False;
  
    return True

m, n = mat1.shape
ctr = 0
for x in range(m):
    for y in range(n):
        if prime(ctr) == True:
            mat1[x][y] = mat1[x][y] ** 3
        ctr += 1
print(mat1)


# In[5]:


#Q4
arr = [[1, 2, 3, 4],[5, 6, 7, 8],[9, 10, 11, 12],[13, 14, 15, 16]]
mat1 = np.array(arr)
print(mat1)
def prime(n):
    if n <= 1:
        return False
  
    for i in range(2, n):
        if n % i == 0:
            return False;
  
    return True


m, n = mat1.shape
ctr = 0
for x in range(m):
    for y in range(n):
        if prime(ctr) == True:
            if y == 0:
                mat1[x][y] = mat1[x][y] ** 3 + mat1[x-1][n-1]
            else:
                mat1[x][y] = mat1[x][y] ** 3 + mat1[x][y-1]
        ctr += 1
print(mat1)


# In[6]:


#Q5
arr1 = [1, 2, 4, 7, 6, 3, 7]
arr2 = [3, 7, 8, 4, 7, 3, 3]
set1 = set(arr1)
set2 = set(arr2)
print(set1 | set2)


# In[7]:


#Q6
lst1 = []
for x in range(7 * 7):
    lst1.append(7 * random.randint(1, 21))
    
arr1 = np.array(lst1).reshape(7, 7)
print(arr1)


# In[8]:


#Q7
a = 6
b = 7
chk = 1
mat2 = np.zeros((a, b)).astype(int)
mat2[::2,::2] = 1
mat2[1::2,1::2] = 1
print(mat2)


# In[9]:


#Q8
lst1 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'a', 'K', 'L', 'M', 'N', 'o', 'P', 'Q', 'R', 'S', 'T', 'U', '0', 'W', 'O']
vowels = ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u']
arr1 = np.array(lst1).reshape(6, 4).astype(dtype=object)
print(arr1)
for x in range(6):
    for y in range(4):
        if arr1[x][y] in vowels:
            arr1[x][y] = np.nan        
print(arr1)
ctr = 0
for x in range(6):
    for y in range(4):
        if arr1[x][y] not in lst1:
            ctr += 1
print('np.nan counts: ', ctr)


# In[ ]:





# In[ ]:





# In[ ]:




