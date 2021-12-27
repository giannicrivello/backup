#!/bin/bash


source=/home/gianni/backup_test_dir/source_dir


dest=/home/gianni/backup_test_dir/dest_dir


#looping through the files in source and listing everything under source

for file in $(find $source -printf "%P\n") ; do
	
        #checking if files in source exists in dest_dir

	if [ -a $dest/$file ] ; then
		if [ $source/$file -nt $dest/$file ] ; then
			echo "Newer file detected copying..."

			#recursivley copying files in source_dir

			cp -r $source/$file $dest/$file
		else
			echo "File $file exists, skipping"
		fi
#if file does not exists, simply copying file from source to dest

	else
	
	echo "$file is being copied over to $dest"

        cp -r $source/$file $dest/$file
        fi
done

