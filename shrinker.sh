#!/bin/bash

INPUTFOLDER="./input"
OUTPUTFOLDER="./output"

INPUTSIZE=$1
OUTPUTSIZE=$2
COMPRESSION=$3

FILES=( $( ls $INPUTFOLDER ) )

INDEX=1
ARRLENGTH=${#FILES[@]}

for FILE in ${FILES[@]}
do
    :
    # echo $FILE
    FULLFILEPATH="${INPUTFOLDER}/${FILE}"
    echo "${INDEX}/${ARRLENGTH}"
    echo $FULLFILEPATH

    # 1. COPY
    echo "  copying..."
    TEMPCOPYPATH="${OUTPUTFOLDER}/temp.gif"
    convert $FULLFILEPATH -coalesce $TEMPCOPYPATH

    # 2. RESIZE
    echo "  resizing..."
    FULLFILEOUTPUTPATH="${OUTPUTFOLDER}/uncompressed_${FILE}"
    convert -size ${INPUTSIZE} ${TEMPCOPYPATH} -resize ${OUTPUTSIZE} ${FULLFILEOUTPUTPATH}

    # 3. COMPRESS
    echo "  compressing..."
    COMPRESSEDOUTPUTPATH="${OUTPUTFOLDER}/${FILE}"
    gifsicle -O3 --lossy=${COMPRESSION} -o ${COMPRESSEDOUTPUTPATH} ${FULLFILEOUTPUTPATH}

    rm ${TEMPCOPYPATH}

    ((INDEX++))
done

echo ""
echo "done shrinking!"