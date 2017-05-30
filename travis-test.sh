#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT () {
    echo "$1" >&2
    rm -f $tmp-*
    exit 1
}

# TEST1
echo please input number > $tmp-ans
./gcd.sh aaa bbb > $tmp-out || ERROR_EXIT "TEST1-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-2"

# TEST2
echo please input number > $tmp-ans
./gcd.sh 2> $tmp-err || ERROR_EXIT "TEST2-1"
diff $tmp-ans $tmp-err && ERROR_EXIT "TEST2-2"

# TEST3
echo dont input 0 and 0 > $tmp-ng
./gcd.sh 0 0> $tmp-zero || ERROR_EXIT "TEST3-1"
diff $tmp-ng $tmp-zero && ERROR_EXIT "TEST3-2"

# TEST4
echo 12 > $tmp-ok
./gcd.sh 12 24> $tmp-input || ERROR_EXIT "TEST4-1"
diff $tmp-ok $tmp-input || ERROR_EXIT "TEST4-2"


echo OK
rm -f $tmp-*
exit 0
