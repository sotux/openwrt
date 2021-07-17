#!/bin/sh

CPU_PROCESSORS=`cat /proc/cpuinfo | grep "processor" | wc -l`

echo "This computer has $CPU_PROCESSORS processor(s)."


./scripts/env switch ac58u-21.02 && make -j$CPU_PROCESSORS
./scripts/env switch cm520-21.02 && make -j$CPU_PROCESSORS

./scripts/env switch newifi3-21.02 && make -j$CPU_PROCESSORS
./scripts/env switch wr1200js-21.02 && make -j$CPU_PROCESSORS
./scripts/env switch k2p-21.02 && make -j$CPU_PROCESSORS

./scripts/env switch wndr3800-21.02 && make -j$CPU_PROCESSORS

./scripts/env switch wndr3700v4-21.02 && make -j$CPU_PROCESSORS
./scripts/env switch wndr4300v1-21.02 && make -j$CPU_PROCESSORS

./scripts/env switch x86-21.02 && make -j$CPU_PROCESSORS
