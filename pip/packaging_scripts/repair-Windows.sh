#!/bin/bash

pushd wheelhouse
mkdir fixed-wheels
popd

# Get rid of second post in .post?.post. tag
for whl in wheelhouse/*.post*.post.*.whl; do
    mv "$whl" "${whl//\.post\./.}"
done

# Bundle external shared libraries into the wheels
for whl in $PWD/wheelhouse/*.whl; do
  mkdir tmp_dir
  pushd tmp_dir
  python -m wheel unpack "$whl"
  #cp ../helics/bin/libzmq*.dll helics-*/helics
  python -m wheel pack helics-*/ --dest-dir=../wheelhouse/fixed-wheels
  popd
  rm -rf tmp_dir
done

