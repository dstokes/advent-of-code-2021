#!/usr/bin/awk -f

# maintain a sliding 4 slot buffer
function push(arr,val) {
  if(length(arr) == 4) {
    arr[0] = arr[1]
    arr[1] = arr[2]
    arr[2] = arr[3]
    delete arr[3]
  }
  arr[length(arr)] = val
}

# compare triplets
function increase(arr) {
  return length(buf) == 4 && arr[0] + arr[1] + arr[2] < arr[1] + arr[2] + arr[3]
}

BEGIN {
  result = 0
  delete buf[0]
}
{
  if(increase(buf)) {
    result++
  }
  push(buf,$1)
}
END {
  if(increase(buf)) {
    result++
  }
  printf "Part 2: %s\n", result
}
