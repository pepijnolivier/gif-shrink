#!/bin/bash

INPUTSIZE="940x529" #width x height
OUTPUTSIZE="629x290" # width x height

COMPRESSION="80" # Define the lossy compression level. (30 is very light compression, 200 is heavy).

./shrinker.sh ${INPUTSIZE} ${OUTPUTSIZE} ${COMPRESSION}