#!/bin/bash

wget https://www.roboti.us/download/mjpro150_linux.zip
unzip mjpro150
mkdir .mujoco
mv mjpro150 .mujoco/mjpro150
cd .mujoco
wget https://www.roboti.us/file/mjkey.txt
cd
pip install --upgrade pip
pip install -U 'mujoco-py<1.50.2,>=1.50.1'
python -c 'import mujoco_py'
python -c 'print("installed")'

