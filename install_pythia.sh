tmp=`dirname ${BASH_SOURCE[@]}`
fcc_bootstrap_dir=`readlink -f $tmp`
the_script=`basename ${BASH_SOURCE[@]}`
if test $# -ne 2 ; then
    echo "$the_script <fcc_build_dir> <fcc_install_dir>"
    return 1
fi
fcc_build_dir=`readlink -f $1`
fcc_install_dir=`readlink -f $2`

source $fcc_bootstrap_dir/env_pythia.sh $fcc_install_dir
source $fcc_bootstrap_dir/wwget.sh

base=$PWD

build_dir=$fcc_build_dir/pythia
url=http://home.thep.lu.se/~torbjorn/pythia8
tgz=pythia8215.tgz
threads=`grep -c ^processor /proc/cpuinfo`

mkdir -p $build_dir
cd $build_dir
echo downloading source...
wwget $url/$tgz
echo unpacking...
tar -zxvf $tgz
cd pythia8215
mkdir -p $PYTHIA8_DIR
echo configure...
./configure --prefix=$PYTHIA8_DIR --with-hepmc2=$HEPMC_PREFIX --enable-shared
echo make install...
make -j $threads install
echo done!
cd $base 
