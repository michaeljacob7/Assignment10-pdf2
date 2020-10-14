#!/bin/bash -x

echo "Welcome to Flip Coin Simulation"

head=0
flipCoin=$((RANDOM%2))
if [ $flipCoin == $head ]
then
	echo "Head"
else
	echo "Tail"
fi

