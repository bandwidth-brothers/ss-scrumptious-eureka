FROM maven:latest
COPY target/ss-scrumptious-auth-0.0.1-SNAPSHOT.jar /home/restaurant-eureka.jar
ENTRYPOINT java -jar /home/restaurant-eureka.jar