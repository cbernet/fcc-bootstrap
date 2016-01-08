source env_pythia.sh
source wwget.sh

base=$PWD
build_dir=$base/build/pythia
install_dir=$PYTHIA8_DIR
url=http://home.thep.lu.se/~torbjorn/pythia8
tgz=pythia8215.tgz
threads=4

mkdir -p $build_dir
cd $build_dir
echo downloading source...
wwget $url/$tgz
echo unpacking...
tar -zxvf $tgz
cd pythia8215
mkdir -p $install_dir
echo configure...
./configure --prefix=$PYTHIA8_DIR --with-hepmc2=$HEPMC_PREFIX --enable-shared
echo make install...
make -j $threads install
echo done!
cd $base 
