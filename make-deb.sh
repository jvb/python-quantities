#!/bin/sh
python setup.py --command-packages=stdeb.command sdist_dsc --no-backwards-compatibility bdist_deb && dpkg -I deb_dist/python-quantities_0.9.0-1_all.deb
