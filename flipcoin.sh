#!/bin/bash -x
declare -A FlipCoin
function flipCoin()
{
   for((i=1;i<=$1;i++))
   do
      side=""
      for((j=1;j<=$2;j++))
      do
         if [ $flip -eq 1 ]
         then
            side+=H
         else
            side+=T
         fi
      done
      updateCount $side
   done
}


function updateCount()
{
   FlipCoin[$1]=$((${FlipCoin[$1]}+1))
}

function calculatePercentage()
{
	for i in ${!FlipCoin[@]}
	do
		FlipCoin[$i]=`echo "scale=2; ${FlipCoin[$i]}*100/$noflip" | bc`
	done
	echo "Key        ${!FlipCoin[@]}"
	echo "Percentage ${FlipCoin[@]}"
}
read -p "How many times you want to flip a coin: " noflip
read -p "Enter your choice : 1) Singlet 2) Doublet " choice
	case $choice in
   	1)
      	noOfCoin=1
      	;;
   	2)
      	noOfCoin=2
      	;;
   	*)
      	echo "Invalid Choice"
      	;;
	esac

flipCoin $noflip $noOfCoin
calculatePercentage
