#!/bin/bash

VERSION="$(grep 'version=' setup.py | cut -d \' -f 2)"

pandoc --from markdown --to rst README.md > README.rst
python setup.py sdist --format=gztar
python setup.py bdist_wheel
ls -l dist
tar -tzf dist/picoredis-$VERSION.tar.gz

if [ "x$1" = "x-u" ]; then
    twine upload -r pypi dist
fi
