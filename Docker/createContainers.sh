#!/bin/bash

echo -n "Enter user name list file: "
read file

while read line
	do
		docker create -it --name $line docker_class_image_2018 /bin/bash
	done < $file
