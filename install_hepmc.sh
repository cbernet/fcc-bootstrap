base=$PWD
build_dir=$base/Softare/HepMC
install_dir=$base/Install
url=http://lcgapp.cern.ch/project/simu/HepMC/download
tgz=HepMC-2.06.09.tar.gz
threads=4

mkdir -p $build_dir
cd $build_dir
echo downloading source...
curl -O $url/$tgz
echo unpacking...
tar -zxvf $tgz
cd HepMC-2.06.09
mkdir -p $install_dir
export HEPMC_PREFIX=$install_dir
echo configure...
./configure --prefix=$HEPMC_PREFIX --with-momentum=GEV --with-length=MM
echo make install...
make -j $threads install
echo done!
cd $base 
