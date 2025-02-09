#----------COMMAND AND ARGUMENTS IN DOCKER

#docker run
docker run ubuntu

#list running containers
docker ps

#list running containers, including those thare stops
docker ps -a

#default command that execute when the container start
CMD["nginx"]

#default command that execute when the container start with parameter
CMD ["nginx", "5"]

#command that execute when the container starts
ENTRYPOINT ["sleep"]

#command that execute when the container starts
ENTRYPOINT ["sleep"]
docker run ubuntu unbunto-slepper 10 => ENTRYPOINT ["sleep", "10"]


#---------------------SECURITY---------------------------

#view process in the host with user
ps aux




