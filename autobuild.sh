#!/bin/sh

CPU_PROCESSORS=`cat /proc/cpuinfo | grep "processor" | wc -l`

echo "This computer has $CPU_PROCESSORS processor(s)."


./scripts/env switch ac58u-19.07 && make -j$CPU_PROCESSORS
./scripts/env switch cm520-19.07 && make -j$CPU_PROCESSORS

./scripts/env switch newifi3-19.07 && make -j$CPU_PROCESSORS
./scripts/env switch wr1200js-19.07 && make -j$CPU_PROCESSORS

./scripts/env switch tl-wr841nv10-ath79-19.07 && make -j$CPU_PROCESSORS
./scripts/env switch tl-wr841nv7-ath79-19.07 && make -j$CPU_PROCESSORS
./scripts/env switch tl-wr841nv8-ath79-19.07 && make -j$CPU_PROCESSORS
./scripts/env switch wndr3800-ath79-19.07 && make -j$CPU_PROCESSORS

./scripts/env switch wndr3700v4-ar71xx-19.07 && make -j$CPU_PROCESSORS
./scripts/env switch wndr4300v1-ar71xx-19.07 && make -j$CPU_PROCESSORS

./scripts/env switch x86-19.07 && make -j$CPU_PROCESSORS
