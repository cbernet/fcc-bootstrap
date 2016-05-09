tmp=`dirname ${BASH_SOURCE[0]}`
fcc_bootstrap_dir=`readlink -f $tmp`
if test $# -ne 1 ; then
    echo "env_pheno.sh <install_dir>"
    return 1
fi
install=`readlink -f $1`
source $fcc_bootstrap_dir/env_hepmc.sh $install
source $fcc_bootstrap_dir/env_pythia.sh $install
source $fcc_bootstrap_dir/env_fastjet.sh $install 


