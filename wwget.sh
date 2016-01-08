wwget()
{
    # wrapper to curl on macos 
    if test $# -ne 1 ; then
	echo "drop_from_path: needs 1 arguments"
	return 1
    fi
    url=$1

    cmd='unknown'
    unamestr=`uname`
    if [[ "$unamestr" == 'Linux' ]]; then
	cmd='wget'
    elif [[ "$unamestr" == 'Darwin' ]]; then
	cmd='curl -O'
    fi
    echo $cmd $url
    $cmd $url
}


