#!/usr/bin/awk -f

BEGIN {
  x = 0; y = 0; a = 0
}

/forward/ { x += $2; y += a * $2 }
/up/ { a -=  $2 }
/down/ { a += $2 }

END {
  printf "Part 2: %s\n", x * y
}

