#!/bin/bash

export CMAKE_PREFIX_PATH

# Disable SWIG for these builds
mv /usr/local/bin/swig /usr/local/bin/swig-bak || true
pushd helics-pip || exit $?
OLD_PATH=$PATH
for PYDIR in "${RUNNER_TOOL_CACHE}"/Python/3*/x64; do
  pythonLocation="${PYDIR}"
  export pythonLocation
  echo "Building wheel using Python at ${pythonLocation}"
  PATH="${PYDIR}/bin:${PYDIR}:$OLD_PATH"
  export PATH
  python -m pip install --upgrade pip
  python -m pip install setuptools wheel
  python setup.py bdist_wheel --dist-dir=../wheelhouse
done

# Swig is already installed on macOS, reenable it
mv /usr/local/bin/swig-bak /usr/local/bin/swig
for PYDIR in "${RUNNER_TOOL_CACHE}"/Python/2*/x64; do
  pythonLocation="${PYDIR}"
  export pythonLocation
  echo "Building wheel using Python at ${pythonLocation}"
  PATH="${PYDIR}/bin:${PYDIR}:$OLD_PATH"
  export PATH
  python -m pip install --upgrade pip
  python -m pip install setuptools wheel
  python setup.py bdist_wheel --dist-dir=../wheelhouse
done
popd || exit $?
