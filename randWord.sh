words=319377
range=319377
max=319377
rndfactor=`echo "scale=0;$range/$max"|bc -l`
let "rndfactor += 2"
number=$RANDOM
let "number %= rndfactor"
let "number += 1"
let "number ^= $RANDOM"
let "number *= $RANDOM"
let "number %= range"
head -n $number ./dic/dictionary.txt | tail -n 1
