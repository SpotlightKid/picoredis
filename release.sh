#!/bin/bash

VERSION="$(grep 'version=' setup.py | cut -d \' -f 2)"
SDIST="dist/picoredis-$VERSION.tar.gz"
WHEEL="dist/picoredis-$VERSION-py2.py3-none-any.whl"

pandoc --from markdown --to rst README.md > README.rst
python setup.py sdist --format=gztar
python setup.py bdist_wheel
ls -l dist
tar -tzf "$SDIST"

if [ "x$1" = "x-u" ]; then
    twine upload -r pypi "$SDIST" "$WHEEL"
fi
