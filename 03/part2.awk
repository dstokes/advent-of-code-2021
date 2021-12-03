#!/usr/bin/env awk -f

func alen(list,    i) {
  for (i in list);
  return i
}

func push(list, value) {
  len = alen(list)
  list[len == 0 ? 0 : len] = value
}

# func sort(list, offset, result) {
#   for (i=0; i<length(list); i++) {
#     push(result[list[i][offset]], list[i])
#   }
#   return result
# }

# func filter(list, offset, bit, result) {
#   for (i=0; i<length(list); i++) {
#     if (list[offset] == bit) {
#       push(result, list[i])
#     }
#   }
#   return result
# }

BEGIN {
  # field per character
  FS=""
}

{
  # sort numbers on first bit
  list[$1] = push(list[$1], $0)
}

END {
   
  print zeros[NR]
  print num[NR]
}
