if test $# -ne 2 ; then
    the_script=`basename ${BASH_SOURCE[0]}`
    echo "$the_script <fcc_source_dir> <fcc_install_dir>"
    return 1
fi
FCC=`readlink -f $1`
fcc_install_dir=`readlink -f $2`
github_user=cbernet
init_script=./init.sh

threads=`grep -c ^processor /proc/cpuinfo`

mkdir $FCC
cd $FCC

git clone https://github.com/$github_user/podio.git
cd podio
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$fcc_install_dir ..
make -j $threads install

cd $FCC

git clone https://github.com/$github_user/fcc-edm.git
cd fcc-edm
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$fcc_install_dir ..
make -j $threads install

cd $FCC

git clone https://github.com/$github_user/fcc-physics.git
cd fcc-physics
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$fcc_install_dir ..
make -j $threads install

cd $FCC

git clone https://github.com/$github_user/heppy.git
cd heppy
source $init_script

cd $FCC
