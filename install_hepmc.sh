source env_hepmc.sh
source wget.sh

base=$PWD
build_dir=$base/build/HepMC
install_dir=$HEPMC_PREFIX
url=http://lcgapp.cern.ch/project/simu/HepMC/download
tgz=HepMC-2.06.09.tar.gz
threads=4

mkdir -p $build_dir
cd $build_dir
echo downloading source...
wget $url/$tgz
echo unpacking...
tar -zxvf $tgz
cd HepMC-2.06.09
mkdir -p $install_dir
echo configure...
./configure --prefix=$HEPMC_PREFIX --with-momentum=GEV --with-length=MM
echo make install...
make -j $threads install
echo done!
cd $base 
