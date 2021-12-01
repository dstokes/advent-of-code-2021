#!/usr/bin/awk -f

function push(arr,val) {
  if(length(arr) == 3) {
    print length(arr)
    arr[0] = arr[1]
    arr[1] = arr[2]
    delete arr[2]
  }
  arr[length(arr)] = val
}

function sum(arr) {
  arr[0] + arr[1] + arr[2]
}

function printarr(arr) {
  printf "[%s, %s, %s]\n", arr[0], arr[1], arr[2]
}

BEGIN {
  i = 0
  delete a[0]
  delete b[0]
  count = 0
}
{
  if(length(b) == 3) {
    if (sum(a) < sum(b)) { count++ }
  }

  push(a,$1)
  printarr(a)
  
  if (i > 0) {
    push(b, $1)
  }
}
END {
  printf "Part 2: %s\n", count
}
