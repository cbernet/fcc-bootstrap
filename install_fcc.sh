if test $# -ne 1 ; then
    the_script=`basename ${BASH_SOURCE[@]}`
    echo "$the_script <fcc_dir>"
    return 1
fi
FCC=`readlink -f $1`
github_user=cbernet
init_script=init.sh

threads=`grep -c ^processor /proc/cpuinfo`

mkdir $FCC
cd $FCC

git clone https://github.com/$github_user/albers-core.git
cd albers-core
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j $threads install

cd $FCC

git clone https://github.com/$github_user/fcc-edm.git
cd fcc-edm
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j $threads install

cd $FCC

git clone https://github.com/$github_user/analysis-cpp.git
cd analysis-cpp
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j $threads install

cd $FCC

git clone https://github.com/$github_user/pythiafcc.git
cd pythiafcc
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j $threads install

cd $FCC

git clone https://github.com/$github_user/heppy.git
cd heppy
source init.sh

cd $FCC

git clone https://github.com/$github_user/heppy_fcc.git
cd heppy_fcc
source init.sh

cd $FCC
