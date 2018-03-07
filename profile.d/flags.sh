#2016 tiagobrait

#export safe default compiler flags

export CFLAGS="-O2 -march=native -mcx16 -mpopcnt -pipe"
export CXXFLAGS="${CFLAGS}"
export NUMJOBS=7
