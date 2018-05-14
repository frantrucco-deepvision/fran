#! /bin/bash

xinput list | grep Touchpad | sed 's/.*id=\([0-9]*\).*/\1/'
