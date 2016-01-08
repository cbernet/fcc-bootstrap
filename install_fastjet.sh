source env_fastjet.sh
source wwget.sh

base=$PWD
build_dir=$base/build/fastjet
install_dir=$FASTJET_ROOT_DIR
url=http://fastjet.fr/repo
tgz=fastjet-3.1.3.tar.gz
threads=4

mkdir -p $build_dir
cd $build_dir
echo downloading source...
wwget $url/$tgz
echo unpacking...
tar -zxvf $tgz
cd fastjet-3.1.3
mkdir -p $install_dir
echo configure...
./configure --prefix=$FASTJET_ROOT_DIR
echo make install...
make -j $threads install
echo done!
cd $base 
