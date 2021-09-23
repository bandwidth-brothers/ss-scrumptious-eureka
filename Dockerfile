FROM maven:latest
COPY target/eureka-service-0.0.1-SNAPSHOT.jar /home/restaurant-eureka.jar
ENTRYPOINT java -jar /home/restaurant-eureka.jar
