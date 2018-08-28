
# Build app & docker image
dockerfile-maven-plugin is used to build the app itself and the docker image
- mvn install dockerfile:build

# Run docker
- docker run -itd -p 5000:8080 -v /<path>/logs:/logs ropasoft/spring-boot-demo

# Log in
- docker exec -it <container-id> sh