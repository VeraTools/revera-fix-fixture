# clamp VALUE MIN MAX prints VALUE limited to the inclusive range MIN..MAX.
clamp() {
  if [ "$1" -lt "$2" ]; then
    echo "$2"
  elif [ "$1" -gt "$3" ]; then
    echo "$3"
  else
    echo "$1"
  fi
}
