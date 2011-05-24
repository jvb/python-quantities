#/bin/sh
# http://www.pytips.com/2010/5/24/how-to-easily-packags-python-softwares-for-ubuntu
export PYTHONPATH=`pwd`:$PYTHONPATH
VERSION=`python -c "import quantities; print quantities.__version__,"`
which py2dsc || { echo "stdeb not installed. Run 'sudo apt-get install python-stdeb' before retrying."; exit; }
rm -r dist
python setup.py sdist &&
cd dist &&
py2dsc quantities-$VERSION.tar.gz &&
cd deb_dist &&
cp ../../quantities/constants/NIST_codata.txt quantities-$VERSION/quantities/constants/ &&
cd quantities-$VERSION &&
debuild
cd ..
echo
echo "Run 'sudo dpkg -i `pwd`/python-quantities_$VERSION-1_all.deb' to install."
