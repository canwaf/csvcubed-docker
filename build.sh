#!/bin/bash
#Simple bash script

echo $PWD

for d in `ls` ; do
    if [ -d $d ] ; then
        echo "Found csvcubed target in ./$d/"
        if [ -d $d/out ] ; then
            echo "Found out folder, skipping. Delete the folder if you want to rebuild. Rob hates this."
        else
            cd $d
            infojson2csvqb build observations.csv -c info.json -m catalog-metadata.json
            git add out/* && git commit -m "Built csv-w for $d"
            cd ..
        fi
    else
        echo "Outputs found in $d skipping."
    fi
done

