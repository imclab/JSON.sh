#! /usr/bin/env bash

cd ${0%/*}

#set -e
fail=0
tests=0
#all_tests=${__dirname:}
#echo PLAN ${#all_tests}
for test in test/*.sh ;
do
  tests=$((tests+1))
  echo TEST: $test
  ./$test
  ret=$? 
  if [ $ret -eq 0 ] ; then
    echo OK: ---- $test
    passed=$((passed+1))
  else
    echo FAIL: $test $fail
    fail=$((fail+ret))
  fi
done

if [ $fail -eq 0 ]; then
  echo -n 'SUCCESS '
else
  echo -n 'FAILURE '
fi
echo   $passed / $tests
