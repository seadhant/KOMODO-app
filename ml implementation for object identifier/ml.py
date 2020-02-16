# -*- coding: utf-8 -*-
"""
Created on Tue Feb 11 07:26:32 2020

@author: UMESH DASPATTANAYAK
"""


















#converting the image into grayscale
import cv2
image=cv2.imread(r"C:\Users\UMESH DASPATTANAYAK\Downloads\Compressed\Garbage classification\Garbage classification\plastic\plastic32.jpg")
#using opencv convering the coored image to gray scale image
gray=cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
#pass th egray scale converted image
cv2.imshow('gray_scale_image',gray)

cv2.waitKey(0)  #how much time it will remain
cv2.destroyAllWindows()


''''
#checking 
'''










#using canny edge
image=cv2.imread(r"C:\Users\UMESH DASPATTANAYAK\Downloads\Compressed\Garbage classification\Garbage classification\plastic\plastic32.jpg")

edge=cv2.Canny(image,50,10)
cv2.imshow('image_with_edges',edge)
cv2.waitKey(0)
cv2.destroyAllWindows()

#canny edge gives in a particular image,
#original image is having much noise
#let us reduce the noise using blurr(gaussian blurr)

import cv2
image=cv2.imread(r"C:\Users\UMESH DASPATTANAYAK\Downloads\Compressed\Garbage classification\Garbage classification\plastic\plastic32.jpg")
blur=cv2.GaussianBlur(image,(3,3),10)
edge=cv2.Canny(image,50,10)
cv2.imshow('blurred image',edge)
cv2.imshow('blurred image',blur)
cv2.waitKey(0)
cv2.destroyAllWindows()

import matplotlib.pyplot as plt
plt.imshow(image)
plt.show()
#the color of the matplotlib is RGB channel
#the color of cv2 is BGR channl

#converting the image from RGB to BGR
rgb_image=cv2.cvtColor(image,cv2.COLOR_BGR2RGB)
plt.imshow(rgb_image)
plt.show()


#let us detect the face manually by plotting a rectangle 
#using grid

plt.imshow(rgb_image)
plt.grid()
#plotting the grid to find out the points of rectangle 
plt.show()
                        #(x,y)     (x1,y1)   (size)    width of frame
cv2.rectangle(rgb_image,(200,200),(400,400),(255,255,0),2) #(x,y)and(x1,y1)
plt.imshow(rgb_image)
plt.show()


#using cascade
import cv2
image= cv2.imread(r"C:\Users\UMESH DASPATTANAYAK\Desktop\New folder\standard_test_images\standard_test_images\lena_color_256.tif")

#getting the face data 
#harrcascade _frontal face.xml is the abstsract to dtect faces
#the data has face image x,y,w,b


face_data=r"C:\Users\UMESH DASPATTANAYAK\Desktop\New folder\data\haarcascades\haarcascade_frontalface_default.xml"

#preparing the model
classifier= cv2.CascadeClassifier(face_data)
#it will only detect the face as the data in harrascade is set for face
#scalefactor=specifying how much the image is reduced at each image scale 
#minenighbor=specifying how many neighbors
#each rectangle should have to retain()
face=classifier.detectMultiScale(image,scaleFactor=1.5,minNeighbors=4)

 




for x,y,w,h in face:
    cv2.rectangle(image,(x,y),(x+w,y+h),(255,255,0),2)
    
cv2.imshow('image',image) 
cv2.waitKey(0)
cv2.destroyAllWindows()

import cv2

cap=cv2.VideoCapture(r"F:\Texting.mp")
             #taking the vide path (0)by default camera
if cap.isOpened(): #checking if it alresdy has video to run from by frame 
    while True:
        _,frame=cap.read()  #(true,[[]])----array
        if frame is not None:
            
            cv2.imshow('abbe saale',frame)
            if cv2.waitKey(30)==27:
                break #30fps and escape ascii
                
        else:
             
             break
cv2.destroyAllWindows()
cap.release()


import cv2
cap=cv2.VideoCapture(r"F:\Texting.mp")
alg=cv2.CascadeClassifier(r"C:\Users\UMESH DASPATTANAYAK\Desktop\New folder\data\haarcascades\haarcascade_frontalface_alt.xml")

ret=True

while ret:
    if cap.isOpened(): #checking if it alresdy has video to run from by frame 
        
        ret,frame=cap.read()
        
        faces=alg.detectMultiScale(frame)
        for x,y,w,h in faces:
            cv2.rectangle(frame,(x,y),(x+w,y+h),(255,255,0),1)
            
        if not ret:
            break
            
        cv2.imshow('video',frame)
        if cv2.waitKey(1)==ord('q'):
            break
cv2.destroyAllWindows()
cap.release()            
            
    
            
                
                