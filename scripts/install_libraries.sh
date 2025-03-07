#!/bin/bash

# this script has two use cases
# 1 - CI testing and local development of TankControllerLib only (SHALLOW)
# 2 - Development of TankControllerLib and the supporting libraries
# comment this out if you want full depth for the supporting libraries (case 2)
export SHALLOW_MAIN='--depth 1 --branch main --single-branch '
export SHALLOW_MASTER='--depth 1 --branch master --single-branch '
# use this if you started with SHALLOW and now want the full repository with history
# git fetch --unshallow

if ! [ $(id -u) = 0 ]; then
  bundle config --local path vendor/bundle
  bundle install
  mkdir -p $(bundle exec arduino_library_location.rb)
  cd $(bundle exec arduino_library_location.rb)
fi

# add missing libraries
export GITHUB="https://github.com/Arduino-CI"
if [ -d "./Adafruit_BusIO" ]; then
  (
    echo update Adafruit_BusIO
    cd Adafruit_BusIO
    git pull
  )
else
  git clone $SHALLOW_MASTER $GITHUB/Adafruit_BusIO.git
fi

if [ -d "./Adafruit_MAX31865" ]; then
  (
    echo update Adafruit_MAX31865
    cd Adafruit_MAX31865
    git pull
  )
else
  git clone $SHALLOW_MAIN $GITHUB/Adafruit_MAX31865.git
fi

if [ -d "./Ethernet" ]; then
  (
    echo update Ethernet
    cd Ethernet
    git pull
  )
else
  git clone $SHALLOW_MASTER $GITHUB/Ethernet.git
fi

if [ -d "./LiquidCrystal" ]; then
  (
    echo update LiquidCrystal
    cd LiquidCrystal
    git pull
  )
else
  git clone $SHALLOW_MASTER $GITHUB/LiquidCrystal.git
fi

if [ -d "./RTClib" ]; then
  (
    echo update RTClib
    cd RTClib
    git pull
  )
else
  git clone $SHALLOW_MASTER $GITHUB/RTClib.git
fi

if [ -d "./Keypad" ]; then
  (
    echo update Keypad
    cd Keypad
    git pull
  )
else
  git clone $SHALLOW_MASTER $GITHUB/Keypad.git
fi

if [ -d "./Arduino-PID-Library" ]; then
  (
    echo update Arduino-PID-Library
    cd Arduino-PID-Library
    git pull
  )
else
  git clone $SHALLOW_MASTER $GITHUB/Arduino-PID-Library.git
fi

if [ -d "./SD" ]; then
  (
    echo update SD
    cd SD
    git pull
  )
else
  git clone $SHALLOW_MAIN $GITHUB/SD.git
fi
