basedir=$PWD/FCC
github_user=cbernet
init_script=init_macos.sh

mkdir $basedir

cd $basedir

git clone https://github.com/$github_user/albers-core.git
cd albers-core
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j 4 install

cd $basedir

git clone https://github.com/$github_user/fcc-edm.git
cd fcc-edm
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j 4 install

cd $basedir

git clone https://github.com/$github_user/analysis-cpp.git
cd analysis-cpp
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j 4 install

cd $basedir

git clone https://github.com/$github_user/pythiafcc.git
cd pythiafcc
source $init_script

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j 4 install

cd $basedir

git clone https://github.com/$github_user/heppy.git
cd heppy
source init.sh

cd $basedir

git clone https://github.com/$github_user/heppy_fcc.git
cd heppy_fcc
source init.sh
