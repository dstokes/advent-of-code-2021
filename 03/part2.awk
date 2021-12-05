#!/usr/bin/env awk -f

func push(a, b) {
  a[length(a)] = b
}

func bintoint(bin) {
  result = 0
  split(bin, bits)
  for (i in bits) {
    result = lshift(result, 1)
    if (bits[i] == 1) result = or(result, 1)
  }
  return result
}

func reduce(list, offset, max, a, b) {
  len = length(list)
  if (len < 2) {
    return list[0]
  }
  delete a[0]
  delete b[0]

  for (i in list) {
    split(list[i], bits)
    if (bits[offset+1] == 1) {
      push(a, list[i])
    } else {
      push(b, list[i])
    }
  }

  lena = length(a)
  lenb = length(b)

  if (max) {
    if (lena >= lenb) {
      return reduce(a, offset+1, max)
    }
    return reduce(b, offset+1, max)
  } else {
    if (lena >= lenb) {
      return reduce(b, offset+1, max)
    }
    return reduce(a, offset+1, max)
  }
}

BEGIN {
  # field per character
  FS=""
  count = 0
  delete a[0]
  delete b[0]
}

{
  # sort numbers on first bit
  numbers[NR-1] = $0
}

END {
  oxygen = reduce(numbers, 0, 1)
  co2 = reduce(numbers, 0, 0)
  print bintoint(oxygen) * bintoint(co2)
}
