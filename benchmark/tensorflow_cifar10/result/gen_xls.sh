#!/bin/bash

SCRIPT_FILE_NAME=$(basename $0)

OUTPUT_TMP_FILE=tmp
OUTPUT_XLS_FILE=result.xls
rm $OUTPUT_TMP_FILE

write_cifar10_result() {
# $1: filename
# $2: log
    cat $1 | grep "Training spent" | awk '{print $3}' >> $2
}

gen_tmp_file() {
    for filename in $PWD/* ; do
        f=$(basename $filename)
        if [ $f == $SCRIPT_FILE_NAME ]; then
            continue
        fi

        echo $f >> $OUTPUT_TMP_FILE
        write_cifar10_result $filename $OUTPUT_TMP_FILE
    done
}

write_xls() {
    awk '
        BEGIN {
            NR=100
            column = -1
            row = 0
            for (i = 0; i < NR; i++)
                for (j = 0; j < NR; j++)
                    data[i, j] = 0
        }

        {
            if ($1~/^[0-9]+$/) {
                row++
                data[row, column] = $0
            } else {
                row = 0
                column++
                data[row, column] = $0
            }
        }

        END {
            for (i = 0; i < row; i++) {
                for (j = 0; j <= column; j++)
                    printf "%d,", data[i, j]
                printf "\n"
            }
        }' $OUTPUT_TMP_FILE
}

gen_tmp_file
write_xls
