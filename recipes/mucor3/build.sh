#!/bin/bash
set -eu -o pipefail

cd "${SRC_DIR}"
cd vcf_atomizer
make
cd ..
cd depthGauge
ldc2 -L-lhts -O2 -release -of depthgauge source/* dhtslib/source/dhtslib/*.d dhtslib/source/dhtslib/htslib/*.d
cd ..
$PYTHON setup.py install --single-version-externally-managed --record=record.txt
cp depthGauge/depthgauge vcf_atomizer/bin/vcf_atomizer $PREFIX/bin
