#!/bin/bash
set -eu -o pipefail

cd "${SRC_DIR}"
cd vcf_atomizer
make deps
make build
cd ..
cd depthGauge
ldc2 -L-lhts -O2 -release -of depthgauge source/* dhtslib/source/dhtslib/*.d dhtslib/source/dhtslib/htslib/*.d

