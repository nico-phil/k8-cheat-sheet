#----------COMMAND AND ARGUMENTS IN DOCKER

#docker run
docker run ubuntu

#list running containers
docker ps

#list running containers, including those that are stops
docker ps -a

#default command that execute when the container start
CMD["nginx"]

#default command that execute when the container start with parameter. 
#you can override this command in the terminal.
CMD ["nginx", "5"]

#command that execute when the container starts. 
#if you add more parameter when running the container, it will be appended in the array
ENTRYPOINT ["sleep"]

#command that execute when the container starts
ENTRYPOINT ["sleep"]
docker run ubuntu unbunto-slepper 10 => ENTRYPOINT ["sleep", "10"]

#if you specify the ENTRYPOINT and CMD in the docker file. 
#the ENTRYPOINT is the default command that run wen the container start
#the CMD is the default parameter. you can still add more parameter in the docker file
ENTRYPOINT ["sleep"]
CMD ["5"]


#---------------------SECURITY---------------------------

#view process in the host with user
ps aux

#run docker image with specfied user
Docker run --user=1000 unbutu sleep 3600

#you can also add the user directly in Docker definition




