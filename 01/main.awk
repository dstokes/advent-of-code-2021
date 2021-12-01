#!/usr/bin/awk -f
BEGIN {
  prev=0;
  count=0
}
{
  if(prev>0 && $1>prev){
    count++;
  }
  prev=$1
}
END {
  printf "Part 1: %s\n", count
}
