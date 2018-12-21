#!/bin/python
# -*- coding: utf-8 -*-

import requests
import datetime
import os

CITY = os.environ['OPEN_WEATHER_MAP_CITY']
API_KEY = os.environ['OPEN_WEATHER_MAP_API_KEY']
UNITS = "Metric"
UNIT_KEY = "C"

try:
    REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&appid={}&units={}".format(CITY, API_KEY, UNITS))
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        SPEED = REQ.json()["wind"]["speed"]
        HUMIDITY = REQ.json()["main"]["humidity"]
        ID = int(float(REQ.json()["weather"][0]["id"]))
        TEMP = int(float(REQ.json()["main"]["temp"]))
        HOUR = datetime.datetime.now().hour

        if ID >= 200 and ID <= 232:
            ICON = ""
        elif ID == 300:
            ICON = ""
        elif ID == 501 or ID == 500 or ID == 520:
            ICON = ""
        elif ID == 521:
            ICON = ""
        elif ID >= 310 and ID <= 531:
            ICON = ""
        elif ID >= 600 and ID <= 622:
            ICON = ""
        elif ID >= 701 and ID <= 761:
            ICON = ""
        elif ID >= 801 and ID <= 804:
            if HOUR >= 6 and HOUR <= 19:
                ICON = ""
            else:
                ICON = ""
        elif ID >= 900 and ID <= 902 or ID >= 957 and ID <= 962:
            ICON = ""
        elif ID == 903 or ID == 906:
            ICON = ""
        elif ID == 904:
            ICON = ""
        elif ID == 905 or ID >= 951 and ID <= 956:
            ICON = ""
        else:
            if HOUR >= 6 and HOUR <= 19:
                ICON = ""
            else:
                ICON = ""
        print("%%{F#FFF}%s %%{F-}%s  %i°%s  %s%%  %skm/h" % (ICON, CURRENT, TEMP, UNIT_KEY, HUMIDITY, SPEED))

except requests.exceptions.RequestException:
    print("Recovering weather forecast")

