wget()
{
    # wrapper to curl on macos 
    if test $# -ne 1 ; then
	echo "drop_from_path: needs 1 arguments"
	return 1
    fi
    url=$1

    wget='unknown'
    unamestr=`uname`
    if [[ "$unamestr" == 'Linux' ]]; then
	wget='wget'
    elif [[ "$unamestr" == 'Darwin' ]]; then
	wget='curl -O'
    fi
    echo $wget $url
    $wget $url
}


