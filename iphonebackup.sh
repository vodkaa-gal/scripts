#!/usr/bin/env bash
idevicepair validate
ifuse ~/iphone

source_dir=/home/monarch/iphone/DCIM
target_dir=/store/pub/media/phone

if [ ! -d "$source_dir" ]; then
	echo "iphone not mounted"
	exit 1;
fi

cd $source_dir

for file in $(find $source_dir); do
	timestamp=$(stat -c '%Y' $file)
	year=$(date -d @$timestamp +'%Y')
	month=$(date -d @$timestamp +'%m - %B')
	today=$(date +'%y.%m.%d.%H.%M.%S')

	if [ ! -d "$target_dir/$year" ]; then
	mkdir "$target_dir/$year"
	echo "new year dir $year"
	fi

	if [ ! -d "$target_dir/$year/$month" ]; then
	mkdir "$target_dir/$year/$month"
	echo "new month $year $month"
	fi

	cp -n "$file" "$target_dir/$year/$month"
	echo "moved $file"

	echo "$target_dir/$year/$month/$(basename $file)" >> "$target_dir/$today.log"
done

echo "finished $(date +'%y %B %dth at %H:%M:%S')" >> "$target_dir/$today.log"
fusermount -u ~/iphone
