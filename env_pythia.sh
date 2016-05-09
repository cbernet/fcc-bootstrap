if test $# -ne 1 ; then
    echo "env_pythia.sh <pythia8_dir>"
    return 1
fi
export PYTHIA8_DIR=`readlink -f $1`
export PYTHIA8DATA=${PYTHIA8_DIR}/share/Pythia8/xmldoc
echo PYTHIA8_DIR:  $PYTHIA8_DIR
echo PYTHIA8DATA:  $PYTHIA8DATA