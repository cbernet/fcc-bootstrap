the_script=`basename ${BASH_SOURCE[0]}`
if test $# -ne 1; then
    echo "usage: $the_script <release_dir>"
    return 1
fi
export FCCRELEASE=`readlink -f $1`
echo "using release $FCCRELEASE"

source /cvmfs/cms.cern.ch/cmsset_default.sh 


export SCRAM_ARCH=slc6_amd64_gcc493
cd $FCCRELEASE/CMS
cmsenv 
cd - 

echo CMSSW_BASE: `readlink -f $FCCRELEASE/CMS` 

source $FCCRELEASE/fcc-bootstrap/env_pheno.sh $FCCRELEASE/install
source $FCCRELEASE/fcc-bootstrap/env_fcc.sh $FCCRELEASE/install_fcc
export HEPPY=$FCCRELEASE/FCC/heppy

export PATH=$FCCRELEASE/install_fcc/bin:$FCCRELEASE/install/bin:$PATH
export LD_LIBRARY_PATH=$FCCRELEASE/install_fcc/lib:$FCCRELEASE/install/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$FCCRELEASE/FCC:$FCCRELEASE/install_fcc/python:$PYTHONPATH

