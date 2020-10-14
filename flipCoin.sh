#!/bin/bash -x

echo "Welcome to Flip Coin Simulation"

HEAD=0
headCount=0
tailCount=0

declare -A singleFlip
read -p "Enter the number of coin flip: " flip

for(( count=0; count<$flip; count++ ))
do
	flipCoin=$(( RANDOM % 2))
	
	if [ $flipCoin -eq $head ]
	then
		singletFlip[HEAD]=$((++headCount))
	else
		singletFlip[TAIL]=$((++tailCount))
	fi
done

singletHeadPercentage=`echo "scale=2; $headCount * 100 / $flip" | bc`
singletTailPercentage=`echo "scale=2; $tailCount * 100 / $flip" | bc`

echo "Single head percentage and head count:$headCount : " $singletHeadPercentage
echo "Single tail percentage and tail count:$tailCount : " $singletTailPercentage

