tmp=`dirname ${BASH_SOURCE[0]}`
fcc_bootstrap_dir=`readlink -f $tmp`
the_script=`basename ${BASH_SOURCE[0]}`
if test $# -ne 2 ; then
    echo "$the_script <fcc_build_dir> <fcc_install_dir>"
    return 1
fi
fcc_build_dir=`readlink -f $1`
fcc_install_dir=`readlink -f $2`

source $fcc_bootstrap_dir/env_fastjet.sh $fcc_install_dir
source $fcc_bootstrap_dir/wwget.sh

base=$PWD

build_dir=$fcc_build_dir/fastjet
url=http://fastjet.fr/repo
tgz=fastjet-3.1.3.tar.gz
threads=`grep -c ^processor /proc/cpuinfo`

mkdir -p $build_dir
cd $build_dir
echo downloading source...
wwget $url/$tgz
echo unpacking...
tar -zxvf $tgz
cd fastjet-3.1.3
mkdir -p $FASTJET_ROOT_DIR
echo configure...
./configure --prefix=$FASTJET_ROOT_DIR
echo make install...
make -j $threads install
echo done!
cd $base 
