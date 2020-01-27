#!/bin/bash -x
flip=$((RANDOM%2))
if [ $flip -eq 1 ]
then 
head=$head+1
else
tail=$tail+1
fi
