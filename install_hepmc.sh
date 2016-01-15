echo d
echo ${BASH_SOURCE[0]}
tmp=`dirname ${BASH_SOURCE[0]}`
echo $tmp
fcc_bootstrap_dir=`readlink -f $tmp`
echo $fcc_bootstrap_dir
the_script=`basename ${BASH_SOURCE[0]}`
if test $# -ne 2 ; then
    echo "$the_script <fcc_build_dir> <fcc_install_dir>"
    return 1
fi
fcc_build_dir=`readlink -f $1`
fcc_install_dir=`readlink -f $2`

source $fcc_bootstrap_dir/env_hepmc.sh $fcc_install_dir
source $fcc_bootstrap_dir/wwget.sh 

base=$PWD

build_dir=$fcc_build_dir/HepMC
url=http://lcgapp.cern.ch/project/simu/HepMC/download
tgz=HepMC-2.06.09.tar.gz
threads=4

mkdir -p $build_dir
cd $build_dir
echo downloading source...
wwget $url/$tgz
echo unpacking...
tar -zxvf $tgz
cd HepMC-2.06.09
mkdir -p $HEPMC_PREFIX
echo configure...
./configure --prefix=$HEPMC_PREFIX --with-momentum=GEV --with-length=MM
echo make install...
make -j $threads install
echo done!
cd $base 
