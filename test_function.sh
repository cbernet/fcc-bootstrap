test_fun()
{
    if test $# -ne 1 ; then
	echo "test_fun: needs 1 argument"
	return 1
    fi
    whom=$1
    echo Hello $whom 
}
