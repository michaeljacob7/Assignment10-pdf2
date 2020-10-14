#!/bin/bash -x

echo "Welcome to Flip Coin Simulation"

#isHead=0
#headCount=0
#tailCount=0
#NUMBER_OF_COIN=2

declare -A flipStore
isFlip=0
max=0
temp=0

#read -p "Enter the number of coin flip: " flip

#for(( count=0; count<$flip; count++ ))
#do
#	flipCoin=$(( RANDOM % 2))
	
#	if [ $flipCoin -eq $head ]
#	then
#		singletFlip[HEAD]=$((++headCount))
#	else
#		singletFlip[TAIL]=$((++tailCount))
#	fi
#done

#singletHeadPercentage=`echo "scale=2; $headCount * 100 / $flip" | bc`
#singletTailPercentage=`echo "scale=2; $tailCount * 100 / $flip" | bc`

#echo "Single head percentage and head count:$headCount : " $singletHeadPercentage
#echo "Single tail percentage and tail count:$tailCount : " $singletTailPercentage

#function doublet()
#{
#	for(( count=0; count<$flip; count++))
#	do
#		for(( countCoin=0; countCoin<$NUMBER_OF_COIN; countCoin++ ))
#		do
#			flipCoin=$(( RANDOM % 2))
#			if [ $flipCoin -eq $isHead ]
#			then
#				coinSide+=H
#			else
#				coinSide+=T
#			fi
#		done
#		((doubletFlip[$coinSide]++))
#		coinSide=""
#	done
#}
#function totalDoubletPercentage()
#{
#	for index in {!doubletFlip[@]}
#	do
#		doubleFlip[$index]=`echo "scale=2; ${doubleFlip[$index]} * 100 / $flip" | bc
#	done
#}

#doublet
#totalDoubletPercentage

#function triplet()
#{
#	for(( count=0; count<$flip; count++ ))
#	do
#		for(( countCoin=0; countCoin<$NUMBER_OF_COIN; countCoin++ ))
#		do
#			flipCoin=$(( RANDOM % 2 ))
#			if [ $flipCoin -eq $isHead ]
#			then
#				coinSide+=H
#			else
#				coinSide+=T
#			fi
#		done
#		((tripletFlip[$coinSide]++))
#		coinSide=""
#	done
#}

#function totalTripletPercentage()
#{
#	for index in ${!tripletFlip[@]}
#	do
#		tripletFlip[$index]=`echo "scale=2; ${tripletFlip[$index]} * 100 / $flip" | bc`
#	done
#}
#triplet
#totalTripletPercentage
function totalFlip()
{
        for(( i=0; i<$1; i++ ))
        do
		side=""
                for(( j=0; j<$2; j++ ))
                do
                        flipCoin=$(( RANDOM % 2 ))
                        if [ $flipCoin -eq $isFlip ]
                        then
                                side+=H
                        else
                                side+=T
                        fi
                done
                flipStore[$side]=$((${flipStore[$side]+1))
        done
	echo "Counting all combinations: $flipStore[@]}"
}

function totalPercentage()
{
        for count in ${!flipStore[@]}
        do
                flipStore[$count]=`echo "scale=2; $((${flipStore[$count]}))/$times*100 " | bc`
		temp=${flipStore[$count]}
		if (( $(echo "$temp >= $max" | bc) ))
		then
			max=$temp
			key=$count
		fi

        done
}

read -p "Enter number of times to flip: " times
read -p "Enter choice 1)Singlet 2)Doublet 3)Triplet : " coins
totalFlip $times $coins
totalPercentage
echo "All head and tail combinations:${flipStore[@]}"
echo "Percentage of all combinations:${flipStore[@]}"
echo "Max winning combination: " $max "-" $key
