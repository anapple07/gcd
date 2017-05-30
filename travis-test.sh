#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT () {
    echo "$1" >&2
    rm -f $tmp-*
    exit 1
}
#########
# TEST1 #
#########
echo aaa bbb NG > $tmp-ans
./gcd.sh aaa bbb > $tmp-out || ERROR_EXIT "TEST1-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-2"

#########
# TEST2 #
#########
echo "same2.sh requires 2 string inputs" > $tmp-ans
./gcd.sh 2> $tmp-err && ERROR_EXIT "TEST2-1"
diff $tmp-ans $tmp-err || ERROR_EXIT "TEST2-2"

echo OK
rm -f $tmp-*
exit 0
