. joindatabases_config.sh

# LISTING CONTENT IN the input/iso directory to get the collections and databases available to append in a global database.

databases=`echo "artigo issues title"`
for files in $databases
do
echo "Appending $files databases"
$cisis_dir/mx null count=0 create=org$files
    for collection in `ls -1 $database_dir"input/iso"`
    do
       echo $collection
       file=$database_dir"input/iso/"$collection"/"$files".iso"

       if [ $files == "artigo" ]
       then
           echo "proc artigo"
           proc="proc='a980#$collection#'"
       elif [ $files == "title" ]
       then
           echo "proc title"
           proc="proc='a706#t#a980#$collection#'" 
       elif [ $files == "issues" ]
       then
           echo "proc issues"
           proc="proc='a980#$collection#'"
       fi

       if [ -f $file ]
       then
           $cisis_dir/mx iso=$file $proc append=org$files -all now
       else
           echo "[ERROR] file doesnt exist: "$file
       fi
    done
    $cisis_dir/mx org$files iso=org$files.iso -all now
    rm org$files.mst org$files.xrf
done
