#!/bin/bash 
H=0
T=1
declare -A flipCoin
function flipCoin()
{
   for((i=1;i<=$1;i++))
   do
      for((j=1;j<=$2;j++))
      do
      	flip=$((RANDOM%2))
			if [ $flip -eq 1 ]
         then
            side+=H
         else
            side+=T
         fi
      done
      updateCount $side
      side=""
   done
}


function updateCount(){
   flipCoin[$1]=$((${flipCoin[$1]} + 1))
}

function calculatePercentage()
{
	for i in ${!flipCoin[@]}
	do
		flipCoin[$i]=`echo "scale=2; ${flipCoin[$i]}*100/$noflip" | bc`
	done
	echo "Key        ${!flipCoin[@]}"
	echo "Percentage ${flipCoin[@]}"
}

function winningPercentage()
{
   echo "Win Combination Percentage"
   for i in ${!flipCoin[@]}
   do
      echo "$i ${flipCoin[$i]}"
   done | sort -k2 -rn | head -1
}

read -p "How many times you want to flip a coin: " noflip
echo "1) Singlet"
echo "2) Doublets"
echo "3) Triplets"
read -p "Enter your choice : " choice

case $choice in
   1)
      noOfCoin=1
      ;;
   2)
      noOfCoin=2
      ;;
	3)
		noOfCoin=3
		;;
   *)
      echo "Invalid Choice"
      ;;
esac

${flipCoin[@]}
${!flipCoin[@]}
flipCoin $noflip $noOfCoin
calculatePercentage
winningPercentage
