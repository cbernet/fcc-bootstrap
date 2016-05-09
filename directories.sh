# demonstrates how to manipulate path names:
# - get absolute path, 
# - get name of current script
# - use basename to strip off path
if test $# -ne 2 ; then
    echo "directories.sh <build_dir> <install_dir>"
    return 1
fi
fcc_build_dir=`readlink -f $1`
echo fcc_build_dir $fcc_build_dir
fcc_install_dir=`readlink -f $2`
echo fcc_install_dir $fcc_install_dir
tmp=`dirname ${BASH_SOURCE[0]}`
fcc_bootstrap_dir=`readlink -f $tmp`
echo fcc_bootstrap_dir $fcc_bootstrap_dir
the_script=`basename ${BASH_SOURCE[0]}`
echo the_script $the_script