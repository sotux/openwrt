#!/bin/sh

CPU_PROCESSORS=`cat /proc/cpuinfo | grep "processor" | wc -l`

echo "This computer has $CPU_PROCESSORS processor(s)."

./scripts/env switch x86-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/x86 bin/targets/x86-24.10

./scripts/env switch rax3000m-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/mediatek/filogic bin/targets/mediatek/filogic-rax3000m-24.10
./scripts/env switch rax3000me-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/mediatek/filogic bin/targets/mediatek/filogic-rax3000me-24.10
./scripts/env switch 360t7-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/mediatek/filogic bin/targets/mediatek/filogic-360t7-24.10

./scripts/env switch ac58u-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/ipq40xx/generic bin/targets/ipq40xx/generic-ac58u-24.10
./scripts/env switch cm520-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/ipq40xx/generic bin/targets/ipq40xx/generic-cm520-24.10

./scripts/env switch newifi3-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/ramips/mt7621 bin/targets/ramips/mt7621-newifi3-24.10
./scripts/env switch wr1200js-24.10 && make clean && make -j$CPU_PROCESSORS && mv bin/targets/ramips/mt7621 bin/targets/ramips/mt7621-wr1200js-24.10
#./scripts/env switch k2p-24.10 && make -j$CPU_PROCESSORS

#./scripts/env switch wndr3800-24.10 && make -j$CPU_PROCESSORS

#./scripts/env switch wndr3700v4-24.10 && make -j$CPU_PROCESSORS
#./scripts/env switch wndr4300v1-24.10 && make -j$CPU_PROCESSORS

#./scripts/env switch zeropi+-24.10 && make -j$CPU_PROCESSORS
