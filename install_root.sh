source env_root.sh

base=$PWD
root_build_dir=$base/build/root
root_install_dir=$ROOTSYS
root_tgz=root_v5.34.34.source.tar.gz
threads=4

mkdir -p $root_build_dir
cd $root_build_dir
curl -O https://root.cern.ch/download/$root_tgz
tar -zxvf $root_tgz
cd root
mkdir -p $root_install_dir
./configure --prefix=$root_install_dir
make -j $threads install

source $root_install_dir/bin/thisroot.sh

cd $base 
