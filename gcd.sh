#!/bin/sh


IsNumber () {
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

    if [ $x -eq 0 ] && [ $y -eq 0 ]; then
        echo "dont input 0 and 0"
        exit
    fi

}

x=$1
y=$2

IsNumber $x $y

if [ $x -gt $y ]; then
    x=$2
    y=$1
fi

r=1
while [ "$r" -eq 0 ]
do
   r=`expr $x % $y`
   x=$y
   y=$r
done

echo $x;
