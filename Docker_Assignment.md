# **Docker Case Study** - Automate Infra allocation for L&D

### **Requirements**-
- Dynamic Allocation of Linux systems for users
- Each user should have independent Linux System
- Specific training environment should be created in Container
- User should not allow to access other containers/images
- User should not allow to access docker command
- Monitor participants containers
- Debug/live demo for the participants if they have any doubts/bug in running applications. 
- Automate container creation and deletion.

## Creating the container image 
1. Create a new container from a base image of your choice

`docker create -it --name docker_class_2018 ubuntu /bin/bash`

2. Start and attach to container

```
docker start docker_class_2018
docker attach docker_class_2018
```

3. Install packages required for the students. For example, training environment for C programming. 

```
apt update
apt install vim
apt install gcc
```

4. Create `questions.txt`, `instructions.txt` and save them.
5. Commit the container 

`docker commit -a "Satvik Ramaprasad" 3352d9ff28e1 docker_class_image_2018`

Now our training container image is ready.


## Allocating Containers To Users
1.  The shell script `createContainers.sh` will automatically create a docker container for every user.

    - `users.txt`
        ```
        Hegde
        Biswesh
        Gopu
        Satvik
        ```
    - `createContainers.sh`
        ```sh
        echo -n "Enter name of file with usernames: "
        read file
        while read user
            do 
                docker create -it --name $user docker_class_image_2018 /bin/bash
            done < $file
        ```
2.  Fill the entries in `users.txt` with usernames and run the shell script `sh createContainers.sh -x`. This creates a docker container corresponding to each username from `users.txt`.
3.  The user can then start using the allocated container by doing the following

     - `Method 1`   
        ```
        docker start <name> # Starts the container
        docker attach <name> # Attach the container
        ```
        
    However attaching to a container may not give the desired behaviour, so it might be better to start a new shell
    
    - `Method 2`       
        ```
        docker start <name> # Starts the container
        docker exec -it <name> /bin/bash
        ```
        

## Monitoring The Containers
The instructor can monitor the containers in many ways. 
- To see usage stats of containers

  `docker stats <user>`
- To see logs of a container 

  `docker logs -f <user>`
- Attach to a container, take control 

  `docker attach <user> # The container shuts down when exited`
- Start a new shell, take control 

  `docker exec -it <user> bin/bash # The container continues to run when exited`
 

## Deleting The Containers
- Automate the deletion using the `deleteContainers.sh` script.

    - `deleteContainers.sh`
        ``` 
        echo -n "Enter name of file containing usernames: "
        read file
        while read user
            do
              docker stop $user  
              docker rm $user
            done < $file
        ```
- You can either delete all users or user by name using ` sh deleteContainers.sh -x`.
