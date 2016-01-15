tmp=`dirname ${BASH_SOURCE[0]}`
echo $tmp
fcc_bootstrap_dir=`readlink -f $tmp`
echo bootdir1 $fcc_bootstrap_dir
the_script=`basename ${BASH_SOURCE[0]}`
if test $# -ne 2 ; then
    echo "$the_script <fcc_build_dir> <fcc_install_dir>"
    return 1
fi
echo a
fcc_build_dir=`readlink -f $1`
echo b
fcc_install_dir=`readlink -f $2`
echo c

source $fcc_bootstrap_dir/install_hepmc.sh $fcc_build_dir $fcc_install_dir
source $fcc_bootstrap_dir/install_pythia.sh $fcc_build_dir $fcc_install_dir
source $fcc_bootstrap_dir/install_fastjet.sh $fcc_build_dir $fcc_install_dir
