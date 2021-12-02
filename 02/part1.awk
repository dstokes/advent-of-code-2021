#!/usr/bin/awk -f

BEGIN {
  x = 0; y = 0
}

/forward/ { x += $2 }
/up/ { y -=  $2 }
/down/ { y += $2 }

END {
  printf "Part 1: %s\n", x * y
}
