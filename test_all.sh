#!/usr/bin/sh

export PYTHONPATH=/home/helio/github/RIDE/utest/:$PYTHONPATH
export PYTHONPATH=/home/helio/github/RIDE/src/:$PYTHONPATH


if [ $# -ge 1 ]
then
    if [ $1 -eq 2 ]
    then
         PY=2
    elif [ $1 -eq 3 ]
    then
         PY=3
    else
        DIR="$1"
    fi
else
    PY=2
    DIR="utest"
fi

shift
if [ $# -eq 1 ]
then
    DIR="$1"
fi

cd /home/helio/github/RIDE/
for i in `ls -1R $DIR | grep ":"`
do
        a=`echo $i |sed s/://g`
        for j in `ls -1 $a/test_*py 2>/dev/null`
        do
		# printf "$j\n"
                b=`python$PY $j`
                if [ $? -eq 1 ]
		then
			printf "MUST FIX: $j\n"
			exit
		fi
        done
done