from PIL import Image
import pytesseract
import cv2
import numpy as np
import imutils
import RPi.GPIO as GPIO
import time
cap = cv2.VideoCapture(0)
import matplotlib.pyplot as plt
import re
import MySQLdb
#import gc
import datetime
import qrcode
import pyimgur
#import os

"""
img = cv2.imread(r'img/frame.jpg',cv2.IMREAD_COLOR)
img = cv2.resize(img, (600,400))
"""

CONTROL_PIN = 17
PWM_FREQ = 50
STEP=15
TRIGGER_PIN = 25
ECHO_PIN = 8

GPIO.setmode(GPIO.BCM)
GPIO.setup(TRIGGER_PIN, GPIO.OUT)
GPIO.setup(ECHO_PIN, GPIO.IN)

GPIO.output(TRIGGER_PIN, GPIO.LOW)
time.sleep(1)


GPIO.setup(CONTROL_PIN, GPIO.OUT)

pwm = GPIO.PWM(CONTROL_PIN, PWM_FREQ)
pwm.start(0)


def cam_test():
    cap.open(0)
    ret, frame = cap.read()
    '''cv2.imshow('frame', frame)'''        
    cv2.imwrite('img/frame.jpg',frame)

    img = cv2.imread(r'img/frame.jpg',cv2.IMREAD_COLOR)
    img = cv2.resize(img, (600,400))
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) 
    gray = cv2.bilateralFilter(gray, 13, 15, 15) 

    edged = cv2.Canny(gray, 30, 200) 
    contours = cv2.findContours(edged.copy(), cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    contours = imutils.grab_contours(contours)
    contours = sorted(contours, key = cv2.contourArea, reverse = True)[:10]
    screenCnt = None

    for c in contours:
        
        peri = cv2.arcLength(c, True)
        approx = cv2.approxPolyDP(c, 0.018 * peri, True)
     
        if len(approx) == 4:
            screenCnt = approx
            break

    if screenCnt is None:
        detected = 0
        print ("No contour detected")
        return
    else:
         detected = 1

    if detected == 1:
        cv2.drawContours(img, [screenCnt], -1, (0, 0, 255), 3)

    mask = np.zeros(gray.shape,np.uint8)
    new_image = cv2.drawContours(mask,[screenCnt],0,255,-1,)
    new_image = cv2.bitwise_and(img,img,mask=mask)

    (x, y) = np.where(mask == 255)
    (topx, topy) = (np.min(x), np.min(y))
    (bottomx, bottomy) = (np.max(x), np.max(y))
    Cropped = gray[topx:bottomx+1, topy:bottomy+1]


    img = cv2.resize(img,(500,300))
    Cropped = cv2.resize(Cropped,(400,200))
    
    cv2.imwrite('img/carcard.jpg', Cropped)
    imgP = cv2.imread(r'img/carcard.jpg',cv2.IMREAD_COLOR)
    #cv2.imshow('place',img)
    #cv2.waitKey()
    #cv2.imshow('place',imgP)
    #cv2.waitKey()

    """
    img2 = cv2.imread(r'img/carcard.jpg')
    """
    #localtime = time.localtime()
    #result = time.strftime("%Y-%m-%d %I:%M:%S", localtime)

    
    code = pytesseract.image_to_string(imgP)
    code = ''.join(code.split())
    if code=="":
        return
    
    
    cv2.imshow('place',img)
    cv2.waitKey()
    #time.sleep(1)
    #cv2.destroyAllWindows()
    Ncode = re.sub(r"[^a-zA-Z0-9]","",code)
    print("車牌號碼：",Ncode)
    
    now=datetime.datetime.now()
    result = now.strftime('%Y-%m-%d %H:%M:%S')
    print(result)
    
    nabb1=str(Ncode)
    nabb2=str(result)
    
    nabb3=nabb1
    img = qrcode.make(nabb3)
    img.save("img/qrcode.png")
    #img.show()
    img3 = cv2.imread(r'img/qrcode.png',cv2.IMREAD_COLOR)
    img3 = cv2.resize(img3, (600,600))
    
    
    #time.sleep(1)
    #cv2.destroyAllWindows()

    
    
        
        
        #cur.execute("insert into abclinebot_carnumber values(0,'%s','%s')"% (nabb1,nabb2))
    
    
    #cv2.imshow('qrcode',img3)
    #cv2.waitKey(0)
    
    dc = angle_to_duty_cycle(80)
    pwm.ChangeDutyCycle(dc)
    time.sleep(3)
    #del code
    #gc.collect()
    #os.remove('img/frame.jpg')
    #print("已刪除圖片")
    cap.release()
    
def angle_to_duty_cycle(angle=0):
    duty_cycle = (0.05 * PWM_FREQ) + (0.19 * PWM_FREQ * angle / 180)
    return duty_cycle

try:
    dc = angle_to_duty_cycle(0)
    pwm.ChangeDutyCycle(dc)
    print('按下 Ctrl-C 可停止程式')
    while True:
        GPIO.output(TRIGGER_PIN, GPIO.HIGH)
        time.sleep(0.00001)
        GPIO.output(TRIGGER_PIN, GPIO.LOW)
        while GPIO.input(ECHO_PIN) == 0:
            start_time = time.time()
        while GPIO.input(ECHO_PIN) == 1:
            end_time = time.time()
        etime = end_time - start_time
        distance = 17150 * etime
        print('距離為 {:.1f} 公分'.format(distance))
        if distance<10:
            dc = angle_to_duty_cycle(0)
            pwm.ChangeDutyCycle(dc)
            time.sleep(1)
            cam_test()
            time.sleep(3)
        else:
            dc = angle_to_duty_cycle(0)
            pwm.ChangeDutyCycle(dc)
        time.sleep(1)
except KeyboardInterrupt:
    print('關閉程式')
finally:
    pwm.stop()
    GPIO.cleanup()







