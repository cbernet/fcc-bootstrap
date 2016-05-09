the_script=`basename ${BASH_SOURCE[0]}`
if test $# -ne 1; then
    echo "usage: $the_script <release_dir>"
    return 1
fi
export FCCRELEASE=`readlink -f $1`
echo "using release $FCCRELEASE"

source /cvmfs/cms.cern.ch/cmsset_default.sh 

# export PODIO=$FCCRELEASE 
# export FCCEDM=$FCCRELEASE
# export FCCPHYSICS=$FCCRELEASE
# export HEPPY=$FCCRELEASE/FCC/heppy

export SCRAM_ARCH=slc6_amd64_gcc493
cd $FCCRELEASE/CMS
cmsenv 
cd - 

export PYTHIA8_DIR=$FCCRELEASE/install
export PYTHIA8DATA=${PYTHIA8_DIR}/share/Pythia8/xmldoc

export PATH=$FCCRELEASE/install_fcc/bin:$FCCRELEASE/install/bin:$PATH
export LD_LIBRARY_PATH=$FCCRELEASE/install_fcc/lib:$FCCRELEASE/install/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$FCCRELEASE/FCC:$FCCRELEASE/install_fcc/python:$PYTHONPATH

