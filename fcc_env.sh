the_script=`basename ${BASH_SOURCE[0]}`
if test $# -ne 1; then
    echo "usage: $the_script <release_dir>"
    return 1
fi
FCCRELEASE=`readlink -f $1`
echo "using release $FCCRELEASE"

source /cvmfs/cms.cern.ch/cmsset_default.sh 

export PODIO=$FCCRELEASE 
export FCCEDM=$FCCRELEASE
export FCCPHYSICS=$FCCRELEASE
export HEPPY=$FCCRELEASE/FCC/heppy

cd $FCCRELEASE/CMS
cmsenv 
cd - 
export PATH=$FCCRELEASE/install_fcc/bin:$FCCRELEASE/install/bin:$PATH
export LD_LIBRARY_PATH=$FCCRELEASE/install_fcc/lib:$FCCRELEASE/install/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$FCCRELEASE/FCC:$FCCRELEASE/install_fcc/python:$PYTHONPATH
