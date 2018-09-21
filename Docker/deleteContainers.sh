echo -n "Enter name of file containing usernames: "
    read file
    while read user
        do
          docker stop $user  
          docker rm $user
        done < $file
