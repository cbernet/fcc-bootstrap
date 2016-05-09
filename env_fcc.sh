if test $# -ne 1 ; then
    echo "env_fcc.sh <install_dir>"
    return 1
fi
export FCC=`readlink -f $1`
export PODIO=$FCC
export FCCEDM=$FCC
export FCCPHYSICS=$FCC

echo FCC:  $FCC