if test $# -ne 1 ; then
    echo "env_hepmc.sh <hepmc_prefix>"
    return 1
fi
export HEPMC_PREFIX=`readlink -f $1`
echo HEPMC_PREFIX:  $HEPMC_PREFIX