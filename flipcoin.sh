#!/bin/bash -x
declare -A FlipCoin
read -p "No Of Iteration:" no
headCount=0
tailCount=0
for ((i=1;i<=no;i++))
do
flip=$((RANDOM%2))
if [ $flip -eq 1 ]
then 
FlipCoin[head]=$((++headCount))
else
FlipCoin[tail]=$((++tailCount))
fi
done
percentageofhead=$((FlipCoin[head]*100/$no))
percentageoftail=$((FlipCoin[tail]*100/$no))

