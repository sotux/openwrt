#!/bin/sh

# adjust package
./scripts/feeds uninstall xray-core
./scripts/feeds uninstall xray-geodata
./scripts/feeds uninstall kcptun
./scripts/feeds install -p cust kcptun
./scripts/feeds install -p helloworld xray-core
./scripts/feeds install -p helloworld xray-geodata