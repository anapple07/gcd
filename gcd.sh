#!/bin/sh

echo -n "please input first number:"
read m

echo -n "please input second number:"
read n

IsCheckNumber () {
	x=$1
	y=$2
	expr $x + 1 > /dev/null 2>&1
	if ! [ $? -lt 2 ] || [ -z "$x" ]; then
  		echo "please input number"
		exit
	fi

	expr $y + 1 > /dev/null 2>&1
	if ! [ $? -lt 2 ] || [ -z "$y" ]; then
  		echo "please input number"
		exit
	fi

	if [ $2 -gt $1 ]; then
		x=$2
		y=$1	
	fi

	if [ $y -eq 0  ]; then
		echo "please don't input 0"
		exit
	fi
}

IsCheckNumber $m $n
x=$m
y=$n
r=1

until [ $r == 0 ]
do
   let "r =$x % $y"
   x=$y
   y=$r
done

echo $x;
