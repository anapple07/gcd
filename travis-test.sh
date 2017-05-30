#!/bin/bash

#OK test
bash ./gcd.sh;

expect -c "
set timeout 20
expect \"\please input first number:";
send \"12\r\";
interact
"

