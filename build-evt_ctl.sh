#!/bin/bash
set -e
set -x

cd ~/Repos/daos

gcc -o build/src/vos/tests/evt_ctl.o -c -Werror -g -Wshadow -Wall -Wno-missing-braces -fpic -D_GNU_SOURCE -DD_LOG_V2 -O2 -DDAOS_VERSION=\"1.1.0\" -DAPI_VERSION=\"0.9.0\" -DCMOCKA_FILTER_SUPPORTED=0 -D_FORTIFY_SOURCE=2 -Wframe-larger-than=4096 -fno-strict-overflow -fno-delete-null-pointer-checks -fwrapv -fstack-protector-strong -fstack-clash-protection -DDAOS_HAS_VALGRIND -Isrc/include/daos -Isrc/include -Iopt/pmdk/include -Iopt/cart/include -Iopt/isal/include -Iopt/argobots/include -Iopt/protobufc/include -Isrc/vos -Ibuild/src/common/tests -Isrc/common/tests src/vos/tests/evt_ctl.c

gcc -o build/src/vos/tests/evt_ctl -Wl,--enable-new-dtags -Wl,-rpath=$HOME/Repos/daos/opt/pmdk/lib -Wl,-rpath=$HOME/Repos/daos/opt/cart/lib -Wl,-rpath=$HOME/Repos/daos/opt/isal/lib -Wl,-rpath=$HOME/Repos/daos/opt/argobots/lib -Wl,-rpath=$HOME/Repos/daos/opt/protobufc/lib -Wl,-rpath=/usr/lib -Wl,-rpath=\$ORIGIN/../lib64/daos_srv -Wl,-rpath=\$ORIGIN/../lib64 build/src/vos/tests/evt_ctl.o build/src/common/tests/utest_common.os -Lbuild/src/common -Lopt/pmdk/lib -Lopt/cart/lib -Lopt/isal/lib -Lbuild/src/bio -Lbuild/src/bio/smd -Lbuild/src/vea -Lbuild/src/vos -Lopt/argobots/lib -Lopt/protobufc/lib -lvos -lbio -labt -lpthread -ldaos_common -ldaos_tests -lgurt -lcart -luuid -lpthread -lpmemobj -lcmocka -lgomp

#install evt_ctl
cp build/src/vos/tests/evt_ctl bin/evt_ctl

echo "success"
cd -

echo "I'm back"
