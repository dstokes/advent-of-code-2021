#!/usr/bin/env awk -f

# lol why?
func bintoint(bin) {
  result = 0
  split(bin, bits)
  for (i in bits) {
    result = lshift(result, 1)
    if (bits[i] == 1) result = or(result, 1)
  }
  return result
}

BEGIN {
  # field per character
  FS=""
}

{
  # how many 1s per column?
  for (i=1; i<=NF; i++) {
    count[i-1] += $i
  }
}

END {
  # construct gamma and epsilon values
  for (v in count) {
    # value greater than rows/2 sets the gamma bit to 1
    if (count[v] > NR/2) {
      gamma = gamma "1"
      epsilon = epsilon "0"
    } else {
      gamma = gamma "0"
      epsilon = epsilon "1"
    }
  }

  print bintoint(gamma) * bintoint(epsilon)
}
