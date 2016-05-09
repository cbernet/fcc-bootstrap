if test $# -ne 1 ; then
    echo "env_fastjet.sh <fastjet_root_dir>"
    return 1
fi
export FASTJET_ROOT_DIR=`readlink -f $1`
echo FASTJET_ROOT_DIR:  $FASTJET_ROOT_DIR