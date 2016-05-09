print_var()
{
    # wrapper to curl on macos 
    if test $# -ne 1 ; then
	echo "print_var: provide variable name"
	return 1
    fi
    varname=$1
    echo $varname:    `printenv $varname`
}


