#!/bin/bash

CFG_DIR=./startup-configs


configure_CLIENT() {
  docker cp $CFG_DIR/$1.sh clab-$2-$1:/tmp/
  docker exec clab-$2-$1 bash /tmp/$1.sh 2>/dev/null
}

echo
PIDS=""
LAB=walk
CLIENT=("client1" "client2" "client3")

for VARIANT in ${CLIENT[@]}; do
  ( configure_CLIENT $VARIANT $LAB) &
  REF=$!
  echo "[$REF] Configuring $VARIANT..."
  PIDS+=" $REF"
done

echo
for p in $PIDS; do
  if wait $p; then
    echo "Process $p success"
  else
    echo "Process $p fail"
  fi
done
echo