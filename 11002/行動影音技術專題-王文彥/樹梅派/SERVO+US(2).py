import RPi.GPIO as GPIO
import time

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

def angle_to_duty_cycle(angle=0):
    duty_cycle = (0.05 * PWM_FREQ) + (0.19 * PWM_FREQ * angle / 180)
    return duty_cycle

try:
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
        if distance<20:
            dc = angle_to_duty_cycle(80)
            pwm.ChangeDutyCycle(dc)
        else:
            dc = angle_to_duty_cycle(0)
            pwm.ChangeDutyCycle(dc)
        time.sleep(1)
except KeyboardInterrupt:
    print('關閉程式')
finally:
    pwm.stop()
    GPIO.cleanup()

