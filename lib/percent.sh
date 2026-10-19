# percent PART TOTAL prints PART as a whole-number percentage of TOTAL,
# limited to 0..100. Prints 0 when TOTAL is 0.
percent() {
  if [ "$2" -eq 0 ]; then
    echo 0
    return
  fi
  clamp $(($1 * 100 / $2)) 0 100
}
