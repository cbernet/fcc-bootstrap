if test $# -ne 2 ; then
    echo "directories.sh <build_dir> <install_dir>"
    return 1
fi
fcc_build_dir=`readlink -f $1`
fcc_install_dir=`readlink -f $2`
tmp=`dirname ${BASH_SOURCE[0]}`
fcc_bootstrap_dir=`readlink -f $tmp`
the_script=`basename ${BASH_SOURCE[0]}`
echo $the_script